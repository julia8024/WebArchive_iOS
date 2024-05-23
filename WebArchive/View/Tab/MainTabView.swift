//
//  MainTabView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/05/24.
//

import SwiftUI

struct MainTabView: View {
        
    private enum Tabs {
        case Piece, Box, Profile
    }

    @State private var selectedTab: Tabs = .Piece

    
    var body: some View {
        TabView(selection: $selectedTab) {
            PieceView()
                .tag(Tabs.Piece)
                .tabItem{
                    Image(systemName: selectedTab == .Piece ? "rectangle.stack.fill" : "rectangle.stack")
                        .environment(\.symbolVariants, .none)
                    Text("조각")
                }
            BoxView()
                .tag(Tabs.Box)
                .tabItem {
                    Image(systemName: selectedTab == .Box ? "shippingbox.fill" : "shippingbox")
                        .environment(\.symbolVariants, .none)
                    Text("상자")
                }
            ProfileView()
                .tag(Tabs.Profile)
                .tabItem {
                    Image(systemName: selectedTab == .Profile ? "person.fill" : "person")
                        .environment(\.symbolVariants, .none)
                    Text("프로필")
                }
        }
        .accentColor(Color.accentColor)
        .onAppear(perform: {
            UITabBar.appearance().unselectedItemTintColor = .lightGray
            
        })
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
