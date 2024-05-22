//
//  ExploreView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var activeCategory: FilteredCategory = .travel
    
    var body: some View {
        VStack {
            header()
            
            ScrollView {
                FilteredArticleCategory(activeCategory: $activeCategory)
                
                
                
                
            }
        }
    }
}

#Preview {
    ExploreView()
}


@ViewBuilder
private func header() -> some View {
    HStack {
        Text("Explore")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        
        Image(systemName: "magnifyingglass")
    }
    .padding()
    .padding(.horizontal, 10)
    .background(.activeFilteredCategory)
}
