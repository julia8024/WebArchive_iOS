//
//  TextModifiers.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/24.
//

import SwiftUI

struct LogoTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color.accentColor)
    }
}


struct IconTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(Color("Text"))
    }
}

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .fontWeight(.semibold)
            .foregroundColor(Color("Text"))
    }
}
