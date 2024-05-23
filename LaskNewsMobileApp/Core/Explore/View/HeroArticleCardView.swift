//
//  HeroArticleCardView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 23/05/2024.
//

import SwiftUI

struct HeroArticleCardView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(.heroArticleCard)
                .clipShape(.rect(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text("Uncovering the Hidden Gems of the Amazon Forest")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    
                    Text("Mr. Lana Kub . May 1, 2023")
                        .foregroundStyle(Color(.systemGray4))
                        .font(.caption)
                    
                    
                }
            }
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    HeroArticleCardView()
}
