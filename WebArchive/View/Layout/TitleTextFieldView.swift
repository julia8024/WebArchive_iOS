//
//  TitleTextFieldView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/06/05.
//

import SwiftUI

struct TitleTextFieldView<TextFieldView>: View where TextFieldView: View{
    
    var title: String
    
    @Binding var text: String
    let textField: TextFieldView
    
    var isOptional: Bool = false // false면 필수

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .modifier(TitleText())
                if isOptional == false {
                    Text("*")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Negative"))
                }
            }
            UnderlineTextFieldView(text: $text, textField: textField)
        }
        
    }
}



