//
//  HomeView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedArticle: Article?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                header()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(Article.mockArticles()) { article in
                            articleCard(article) {
                                selectedArticle = article
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                justForYouView()
                
                
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(Article.mockArticles()) { article in
                            articleCard(article) {
                                selectedArticle = article
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .opacity(selectedArticle != nil ? 0 : 1)
        .overlay {
            if let article = selectedArticle {
                ArticleDetailedView()
                    .transition(.slide)
            }
        }
    }
}

#Preview {
    HomeView()
}


@ViewBuilder
private func header() -> some View {
    HStack {
        VStack(alignment: .leading) {
            Text("Good Morning")
                .font(.subheadline)
            
            Text("Sun 9 April, 2024")
                .font(.title2)
        }
        .bold()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        
        
        HStack {
            Image(systemName: "sun.max.fill")
                .font(.title2)
                .foregroundStyle(.yellow)
            Text("Sunny 32")
        }
    }
    .padding(.horizontal)
}

@ViewBuilder
private func articleCard(_ article: Article, onArticlePressed: (() -> ())?) -> some View {
    VStack(alignment: .leading) {
        Image(article.articleImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250, height: 250)
            
        
        Text(article.articleTitle)
            .font(.title3).bold()
            .frame(width: 260, height: 50, alignment: .leading)
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        
        Text(article.articleCateogory.rawValue)
            .foregroundStyle(Color(.systemGray2))
            .font(.subheadline)
    }
    .padding(.horizontal)
    .onTapGesture {
        withAnimation(.smooth) {
            onArticlePressed?()
        }
    }
    
}

@ViewBuilder
private func justForYouView() -> some View {
    VStack {
        HStack {
            Text("Just For You")
                .font(.title3).bold()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            Button {} label: {
                Text("See More")
                    .padding(8)
            }
        }
    }
    .padding(.horizontal)
    
    
}
