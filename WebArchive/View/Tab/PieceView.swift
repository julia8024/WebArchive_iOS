//
//  PieceView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/24.
//

import SwiftUI
import LinkPresentation
import UniformTypeIdentifiers


struct PieceView: View {
    
    @Environment(\.managedObjectContext) private var manageObjContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Link.id, ascending: false)]) var links: FetchedResults<Link>
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 4)
    
    @State private var inputTitle: String = ""
    @State private var inputURL: String = ""
    
    
    var body: some View {
            
        // 그리드뷰
        ScrollView {
            PieceItemList(itemList: links, isAddable: true)
        }
    }

}



struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView()
    }
}
