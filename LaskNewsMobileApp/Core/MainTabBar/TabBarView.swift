//
//  TabBarView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var activeTab: Tab = .home
    @State private var showTabBar: Bool = true
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $activeTab) {
                
                HomeView(showTabBar: $showTabBar)
                    .tabItem { Image(systemName: "house") }
                    .tag(Tab.home)
                
                ExploreView()
                    .tabItem { Image(systemName: "house") }
                    .tag(Tab.explore)
                
                BookmarkView()
                    .tabItem { Image(systemName: "house") }
                    .tag(Tab.bookmark)
                
                Text("Profile View")
                    .tabItem { Image(systemName: "house") }
                    .tag(Tab.profile)
            }
            
            if showTabBar {
                CustomTabBar(activeTab: $activeTab)
            }
                
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
