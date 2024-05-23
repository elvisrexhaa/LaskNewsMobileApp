//
//  ArticleRowCardView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 23/05/2024.
//

import SwiftUI

struct ArticleRowCardView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Experience the Serenity of Japan's Traditional ")
                    .bold()
                    .font(.title3)
                
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    
                    Text("Mr. Lana Kub . May 1, 2023")
                        .foregroundStyle(Color(.systemGray4))
                        .font(.caption)
                    
                    
                }
            }
            
            Image(.articleCardImage3)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 112, height: 80)
                .clipShape(.rect(cornerRadius: 8))
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    ArticleRowCardView()
}
