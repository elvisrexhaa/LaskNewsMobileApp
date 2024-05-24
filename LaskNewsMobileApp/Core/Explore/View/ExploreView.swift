//
//  ExploreView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var activeCategory: FilteredCategory = .business
    @State private var animateSearchBar: Bool = false
    
    @EnvironmentObject private var exploreViewModel: ExploreViewModel
    @State private var selectedArticleByCategory: Article?
    
    var body: some View {
        VStack(spacing: 16) {
            exploreHeader(animateSearchBar: $animateSearchBar, text: $exploreViewModel.text)
            
            ScrollView {
                FilteredArticleCategory(activeCategory: $activeCategory)
                    .padding(.top, 6)
                    .padding(.bottom, 10)
                
                HeroArticleCardView()
                
                
                LazyVStack(spacing: 16) {
                    ForEach(exploreViewModel.filterArticles, id: \.title) { article in
                        ArticleRowCardView(article: article, onBookmarkPressed: {
                            exploreViewModel.addArticleToBookmark(article: article)
                        })
                        .environmentObject(exploreViewModel)
                        
                            .onTapGesture {
                                withAnimation(.smooth) {
                                    selectedArticleByCategory = article
                                }
                            }
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 60)
                
                
                
                
                
            }
            .scrollIndicators(.hidden)
        }
        
        
        
        .animation(.snappy, value: exploreViewModel.text)
        .opacity(selectedArticleByCategory != nil ? 0 : 1)
        .overlay(content: {
            if let selectedArticleByCategory = selectedArticleByCategory {
                Text(selectedArticleByCategory.title)
                    .transition(.slide)
            }
        })
        .onChange(of: activeCategory) { oldValue, newValue in
            Task {
                do {
                    try await exploreViewModel.fetchArticleByCategory(selectedCategory: newValue)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .onAppear {
            Task {
                do {
                    try await exploreViewModel.fetchArticleByCategory(selectedCategory: activeCategory)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(ExploreViewModel())
}


@ViewBuilder
private func exploreHeader(animateSearchBar: Binding<Bool>, text: Binding<String>) -> some View {
    HStack {
        Text("Explore")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .opacity(animateSearchBar.wrappedValue ? 0 : 1)
            .overlay {
                if animateSearchBar.wrappedValue {
                    TextField("Search for articles", text: text)
                        .padding()
                        .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 8))
                        .transition(.offset(x: -UIScreen.main.bounds.width))
                }
                
            }
        
        ZStack {
            if animateSearchBar.wrappedValue {
                Button {
                    withAnimation(.snappy) {
                        //reset the text
                        text.wrappedValue = ""
                        animateSearchBar.wrappedValue = false
                    }
                } label: {
                    Image(systemName: "xmark")
                }
            } else {
                Button {
                    withAnimation(.snappy) {
                        animateSearchBar.wrappedValue = true
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
            
            
            
            
        }
        .foregroundStyle(Color(.systemGray2))
        .bold()
    }
    .padding()
    //    .padding(.horizontal, 10)
    .background(.activeFilteredCategory)
}
