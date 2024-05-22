//
//  CustomTabBar.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

enum Tab: CaseIterable {
    case home
    case explore
    case bookmark
    case profile
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .explore:
            return "globe"
        case .bookmark:
            return "bookmark"
        case .profile:
            return "person"
        }
    }
    
    var tabTitle: String {
        switch self {
        case .home:
            return "Home"
        case .explore:
            return "Explore"
        case .bookmark:
            return "Bookmark"
        case .profile:
            return "Profile"
        }
    }
    
    
}



struct CustomTabBar: View {
    
    @Binding var activeTab: Tab
    
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.hashValue) { tab in
                Button {
                    withAnimation(.snappy) {
                        activeTab = tab
                    }
                } label: {
                    HStack(spacing: activeTab == Tab.bookmark ? 10 : 0) {
                        Image(systemName: tab.imageName)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        
                        if activeTab == tab {
                            Text(tab.tabTitle)
                                .font(.caption)
                                .frame(width: 60)
                        }
                        
                    }
                    .foregroundStyle(activeTab == tab ? .white : .gray).bold()
                    .padding(.horizontal)
                    .frame(height: 40)
                    .background {
                        ZStack {
                            if activeTab == tab {
                                Color.activeTabBg
                                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 20)
        .background(.customTabBg.opacity(0.95), in: .rect(topLeadingRadius: 20, topTrailingRadius: 20))
    }
}

//#Preview {
//    CustomTabBar()
//}
