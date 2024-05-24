//
//  ExploreViewModel.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 24/05/2024.
//

import Foundation
import SwiftUI

class ExploreViewModel: ObservableObject {
    
    @Published var articlesByCategory: [Article] = []
    @Published var bookmarks: [Article] = []
    @Published var text: String = ""
    
    func fetchArticleByCategory(selectedCategory: FilteredCategory) async throws {
        
        Task { @MainActor in
            let articles : ArticleResponse = try await NetworkService.shared.fetchArticles(url: URLConstants.articleByCategoryUrl(category: selectedCategory))
            self.articlesByCategory = Array(Set(articles.articles))
        }
        
    }
    
    var filterArticles: [Article] {
        text.isEmpty ? articlesByCategory : articlesByCategory.filter { $0.title.localizedStandardContains(text) }
    }
    
    
    func addArticleToBookmark(article: Article) {
        withAnimation(.smooth) {
            bookmarks.append(article)
        }
    }
    
}
