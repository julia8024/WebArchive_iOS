//
//  PieceItemList.swift
//  WebArchive
//
//  Created by 장세희 on 2024/06/04.
//

import SwiftUI

struct PieceItemList: View {
    
    
    var itemList: [StringLink]
    var isAddable: Bool = true
    
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {

        LazyVGrid(columns: columns) {
            if isAddable == true {
                AddableItem()
                    .padding(.bottom, 30)
            }
            
            if (itemList.count > 0) {
                ForEach(itemList) { l in
                    PieceItem(viewModel: PreviewViewModel(l.url))
                }
                .padding(.bottom, 30)
            }
        }
        .padding(30)
    }
}

struct PieceItemList_Previews: PreviewProvider {
    
    static var previews: some View {
        PieceItemList(itemList: [StringLink(id: UUID(), url: "https://www.apple.com"),
                                 StringLink(id: UUID(), url: "https://naver.com"),
                                 StringLink(id: UUID(), url: "https://velog.io"),
                                 StringLink(id: UUID(), url: "https://github.com"),
                                 StringLink(id: UUID(), url: "https://school.programmers.co.kr/learn/challenges/beginner"),
                                 StringLink(id: UUID(), url: "http://chat.openai.com/"),
                                 StringLink(id: UUID(), url: "https://youtube.com"),
                                 StringLink(id: UUID(), url: "https://solved.ac/")],
        isAddable: true)
    }
}
