//
//  PieceItem.swift
//  WebArchive
//
//  Created by 장세희 on 2024/06/04.
//

import SwiftUI

struct PieceItem: View {
    
    @ObservedObject var item: Link
    @ObservedObject var viewModel: PreviewModel
    
    
    var body: some View {
        
        // 이전 코드
//        VStack {
//            VStack {
//                if let icon = viewModel.icon {
//                    Image(uiImage: icon)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 66, height: 66)
//                        .clipped()
//                        .cornerRadius(14)
//                } else {
//                    Rectangle()
//                        .frame(width: 66, height: 66)
//                        .clipped()
//                        .foregroundColor(Color("WhiteGray"))
//                        .cornerRadius(14)
//                }
//            }
//            .padding(.bottom, 6)
//            
//            VStack(alignment: .leading, spacing: 1, content: {
//                if let title = viewModel.title {
//                    Text(title)
//                        .modifier(IconTitle())
//                }
//            })
//            .frame(maxWidth: .infinity, alignment: .center)
//        }
//        .frame(maxWidth: .infinity)
//        .frame(height: 100, alignment: .leading)
        
        
        VStack {
            VStack {
                if let icon = viewModel.icon {
                    Image(uiImage: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 66, height: 66)
                        .clipped()
                        .cornerRadius(14)
                } else {
                    Rectangle()
                        .frame(width: 66, height: 66)
                        .clipped()
                        .foregroundColor(Color("WhiteGray"))
                        .cornerRadius(14)
                }
            }
            .padding(.bottom, 6)
            
            VStack(alignment: .leading, spacing: 1, content: {
                if let title = item.title {
                    Text(title)
                        .modifier(IconTitle())
                } else {
                    Text(viewModel.title ?? "untitled")
                        .modifier(IconTitle())
                }
            })
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100, alignment: .leading)
    }
}
