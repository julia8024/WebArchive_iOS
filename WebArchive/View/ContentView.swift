//
//  ContentView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var isLaunching: Bool = true
    @Environment(\.managedObjectContext) var manageObjContext
        
    var body: some View {
        if isLaunching {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        isLaunching = false
                    }
                }
        } else {
            MainTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
