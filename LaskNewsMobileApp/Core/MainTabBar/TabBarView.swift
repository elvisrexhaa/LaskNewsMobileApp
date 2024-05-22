//
//  TabBarView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var activeTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $activeTab) {
                
                HomeView()
                    .tabItem { Image(systemName: "house") }
                    .tag(Tab.home)
                
                ExploreView()
                    .tabItem { Image(systemName: "house") }
                    .tag(Tab.explore)
                
                Text("Bookmark View")
                    .tabItem { Image(systemName: "house") }
                    .tag(Tab.bookmark)
                
                Text("Profile View")
                    .tabItem { Image(systemName: "house") }
                    .tag(Tab.profile)
            }
            
            CustomTabBar(activeTab: $activeTab)
                
        }
        .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        .onAppear {
            UITabBar.appearance().isHidden = true
        }
    }
}

#Preview {
    TabBarView()
}
