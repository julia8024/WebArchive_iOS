//
//  SplashView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/24.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        VStack {
            VStack {
                Image("AppLogoClear")
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipped()
                    .padding(.horizontal, 80)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.accentColor)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
