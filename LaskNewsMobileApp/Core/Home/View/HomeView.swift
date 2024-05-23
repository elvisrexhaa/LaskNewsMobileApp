//
//  HomeView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var selectedArticle: Article?
    @Binding var showTabBar: Bool
    @Namespace private var animation
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                header()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(homeViewModel.topHeadlineArticles, id: \.title) { article in
                            articleCard(article, onArticlePressed: {
                                selectedArticle = article
                                showTabBar = false
                            }, animation: animation)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                justForYouView()
                
                
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(homeViewModel.topHeadlineArticles, id: \.title) { article in
                            articleCard(article, onArticlePressed: {
                                selectedArticle = article
                                showTabBar = false
                            }, animation: animation)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .opacity(selectedArticle != nil ? 0 : 1)
        .overlay {
            if let article = selectedArticle {
                ArticleDetailedView(showTabBar: $showTabBar, selectedArticle: $selectedArticle, article: article, animation: animation)
                    .transition(.offset(x: -UIScreen.main.bounds.width - 100))
            }
        }
    }
}

#Preview {
    HomeView(showTabBar: .constant(false))
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
                .font(.caption)
                .fontWeight(.semibold)
        }
    }
    .padding(.horizontal)
    .padding(.top, 15)
}

@ViewBuilder
private func articleCard(_ article: Article, onArticlePressed: (() -> ())?, animation: Namespace.ID) -> some View {
    VStack(alignment: .leading) {
        
        if let imageUrl = article.urlToImage {
            
            KFImage(URL(string: imageUrl))
                .resizable()
//                .matchedGeometryEffect(id: article.id, in: animation)
//                .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 3.5)
                .clipShape(.rect(cornerRadius: 10))
        } else {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.clear)
                .frame(width: 250, height: 250)
                .overlay {
                    ProgressView()
                }
        }

        Text(article.title)
            .font(.title3).bold()
            .frame(width: 260, height: 50, alignment: .leading)
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        
        Text(article.author ?? "")
            .foregroundStyle(Color(.systemGray2))
            .font(.subheadline)
            .lineLimit(1)
            .frame(width: 200, alignment: .leading)
    }
    .padding(.leading)
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
