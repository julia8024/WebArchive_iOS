//
//  AddableItem.swift
//  WebArchive
//
//  Created by 장세희 on 2024/06/05.
//

import SwiftUI

struct AddableItem: View {
    @State private var openAddItemSheet = false
    
    var body: some View {
        VStack {
            Button {
                openAddItemSheet = true
            } label : {
                VStack {
                    VStack {
                        Image(systemName: "plus")
                            .environment(\.symbolVariants, .none)
                            .foregroundColor(Color("Gray"))
                            .font(.system(size: 24))
                    }
                    .frame(width: 66, height: 66)
                    .cornerRadius(14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .strokeBorder(
                                style: StrokeStyle(
                                    lineWidth: 1,
                                    dash: [10]
                                ))
                            .frame(width: 66, height: 66)
                            .foregroundColor(Color("Gray"))
                    )
                    .padding(.bottom, 6)
                    
                    VStack(alignment: .leading, spacing: 1, content: {
                        Text("조각 추가")
                            .modifier(IconTitle())
                    })
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .sheet(isPresented: $openAddItemSheet) {
            EditPieceView(isPresented: $openAddItemSheet)
        }
    }
    
}

struct AddableItem_Previews: PreviewProvider {
    static var previews: some View {
        AddableItem()
    }
}
