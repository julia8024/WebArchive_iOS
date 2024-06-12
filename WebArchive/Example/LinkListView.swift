//
//  LinkListView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/06.
//

import SwiftUI
import LinkPresentation

struct LinkListView: View {
    
    @State var redrawPreview = false
    
    let links: [StringLink] = [
        StringLink(id: UUID(), url: "url1"),
        StringLink(id: UUID(), url: "url2"),
        StringLink(id: UUID(), url: "url3")
    ]
    
    var body: some View {
        List(links) { l in
            VStack {
                
                LinkRow(previewURL: URL(string: l.url)!, redraw: self.$redrawPreview)
            }
        }.environment(\.defaultMinListRowHeight, 50)
    }
}

struct LinkRow: UIViewRepresentable {
    var previewURL: URL
    @Binding var redraw: Bool
    
    func makeUIView(context: Context) -> LPLinkView {
        let view = LPLinkView(url: previewURL)
        
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: previewURL) { metadata, error in
            if let md = metadata {
                DispatchQueue.main.async {
                    view.metadata = md
                    view.sizeToFit()
                    self.redraw.toggle()
                }
            } else if error != nil {
                let md = LPLinkMetadata()
                md.title = "Custom title"
                view.metadata = md
                view.sizeToFit()
                self.redraw.toggle()
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: LPLinkView, context: Context) {
        
    }
}

struct LinkListView_Previews: PreviewProvider {
    static var previews: some View {
        LinkListView()
    }
}


