//
//  URLPreviewView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/06.
//

import SwiftUI
import LinkPresentation
import UniformTypeIdentifiers


final class PreviewViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var title: String?
    @Published var url: String?
    @Published var icon: UIImage?
    
    let previewURL: URL?
    
    init(_ url: String) {
        self.previewURL = URL(string: url)
        
        fetchMetadata()
    }
    
    private func fetchMetadata() {
        guard let previewURL else { return }
        let provider = LPMetadataProvider()
        
        Task {
            let metadata = try await provider.startFetchingMetadata(for: previewURL)
            
            
            image = try await convertToImage(metadata.imageProvider)
            icon = try await convertToImage(metadata.iconProvider)
            title = metadata.title
            
            url = metadata.url?.host()
        }
    }
    
    private func convertToImage(_ imageProvider: NSItemProvider?) async throws -> UIImage? {
        var image: UIImage?
        
        if let imageProvider {
            let type = String(describing: UTType.image)
            
            if imageProvider.hasItemConformingToTypeIdentifier(type) {
                let item = try await imageProvider.loadItem(forTypeIdentifier: type)
                
                if item is UIImage {
                    image = item as? UIImage
                }
                
                if item is URL {
                    guard let url = item as? URL,
                          let data = try? Data(contentsOf: url) else { return nil }
                    
                    image = UIImage(data: data)
                }
                
                if item is Data {
                    guard let data = item as? Data else { return nil }
                    
                    image = UIImage(data: data)
                }
            }
        }
        
        return image
    }
}

struct URLPreviewView: View {
    
    @Environment(\.managedObjectContext) var manageObjContext
    @FetchRequest(sortDescriptors: []) var link: FetchedResults<Link>
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 4)
    
    let links: [StringLink] = [
        StringLink(id: UUID(), url: "https://www.apple.com"),
        StringLink(id: UUID(), url: "https://naver.com"),
        StringLink(id: UUID(), url: "https://velog.io"),
        StringLink(id: UUID(), url: "https://github.com"),
        StringLink(id: UUID(), url: "https://school.programmers.co.kr/learn/challenges/beginner"),
        StringLink(id: UUID(), url: "http://chat.openai.com/"),
        StringLink(id: UUID(), url: "https://youtube.com"),
        StringLink(id: UUID(), url: "https://solved.ac/")
    ]
    
    @State private var inputTitle: String = ""
    @State private var inputURL: String = ""
    @State private var selectedSide: SegmentToggleIcons = .icon
    
    var body: some View {
        // 리스트뷰
//        VStack {
//            List(links) { l in
//                VStack {
//                    URLPreviewRow(
//                        viewModel: PreviewViewModel(l.string))
//                }
//            }
//        }
        VStack {
            TextField(inputTitle.isEmpty ? "Title 입력" : inputTitle, text: $inputTitle)
                .padding(10)
                .border(.gray, width: 1)
                .padding(30)
                .textInputAutocapitalization(.never)
            
            TextField(inputURL.isEmpty ? "URL 입력" : inputURL, text: $inputURL)
                .padding(10)
                .border(.gray, width: 1)
                .padding(30)
                .textInputAutocapitalization(.never)
            
            HStack {
                // segmented control
                Picker("Choose a Side", selection: $selectedSide) {
                    ForEach(SegmentToggleIcons.allCases, id: \.self) {
                        Image(systemName: String($0.rawValue))
                            .environment(\.symbolVariants, .none)
                            .imageScale(.medium)
                            .foregroundColor(Color(.blue))
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.horizontal, 30)
                
        
//        Button("링크 추가하기", action: {
//            CoreDataViewModel()
//                .addLink(
//                    title: inputTitle,
//                    url: inputURL,
//                    url_type: selectedSide == .icon ? "icon" : "content",
//                    context: manageObjContext)
//        })
            
            // 그리드뷰
            ScrollView {
                if (link.count > 0) {
                    LazyVGrid(columns: columns) {
                        ForEach(link) { l in
                            URLPreviewGridRow(viewModel: PreviewViewModel(l.url ?? ""))
                        }
                        .padding(.bottom, 30)
                    }
                    .padding(30)
                }
                
            }
        }
                         
    }
}

enum SegmentToggleIcons: String, CaseIterable {
    case icon = "app.badge.fill"
    case content = "link"
}

struct URLPreviewGridRow: View {
    
    @ObservedObject var viewModel: PreviewViewModel
    
    var body: some View {
        
        VStack {
            
            if let icon = viewModel.icon {
                Image(uiImage: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 60, maxHeight: 60)
                    .clipped()
                    .cornerRadius(16)
            } else {
                Rectangle()
                    .frame(width: 60, height: 60)
                    .clipped()
                    .foregroundColor(Color(.systemGray5))
                    .cornerRadius(16)
            }

            VStack(alignment: .leading, spacing: 1, content: {
                if let title = viewModel.title {
                    Text(title)
                        .font(.body)
                        .foregroundColor(.black)
                }
            })
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100, alignment: .leading)
    }
}


struct URLPreviewRow: View {
    
    @ObservedObject var viewModel: PreviewViewModel
    
    var body: some View {
        
        HStack(spacing: 15) {
//            if let image = viewModel.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(maxWidth: 107, maxHeight: 107)
//                    .clipped()
//                    .cornerRadius(16)
//            }
            
            if let icon = viewModel.icon {
                Image(uiImage: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 107, maxHeight: 107)
                    .clipped()
                    .cornerRadius(16)
            }

            VStack(alignment: .leading, spacing: 1, content: {
                if let title = viewModel.title {
                    Text(title)
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }
                
                if let url = viewModel.url {
                    Text(url)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
            })
            .padding(.vertical, 10)
            .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100, alignment: .leading)
    }
}

struct URLPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        URLPreviewView()
    }
}
