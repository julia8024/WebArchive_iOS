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
    
    
    var body: some View {
            
        // 그리드뷰
        ScrollView {
            
            if (links.count > 0) {
                PieceItemList(itemList: links)
            }
        }
    }

}


struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView()
    }
}
