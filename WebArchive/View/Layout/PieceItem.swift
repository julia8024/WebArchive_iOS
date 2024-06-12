//
//  PieceItem.swift
//  WebArchive
//
//  Created by 장세희 on 2024/06/04.
//

import SwiftUI

struct PieceItem: View {
    
    @ObservedObject var viewModel: PreviewViewModel
    
    var body: some View {
        
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
                if let title = viewModel.title {
                    Text(title)
                        .modifier(IconTitle())
                }
            })
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100, alignment: .leading)
    }
}
