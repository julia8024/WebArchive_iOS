//
//  UnderlineTextFieldView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/06/05.
//

import SwiftUI

struct UnderlineTextFieldView<TextFieldView>: View where TextFieldView: View {

    @Binding var text: String
    let textField: TextFieldView


    var body: some View {
        HStack {
            underlineTextFieldView
        }
    }
}

extension UnderlineTextFieldView {

    private var underlineTextFieldView: some View {
        VStack(alignment: .leading) {
            textField
                .font(.system(size: 20))
                .foregroundColor(Color("Text"))
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 10)
            
            underlineView
        }
    }

    private var underlineView: some View {
        Rectangle().frame(height: 1)
          .foregroundColor(Color("Text"))
    }
}
