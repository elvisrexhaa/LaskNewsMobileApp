//
//  HomeViewModel.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 23/05/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var topHeadlineArticles: [Article] = []
    @Published var selectedCategory: FilteredCategory = .entertainment
    
    init() {
        Task {
            do {
                try await fetchTopHeadlineArticles()
            } catch {
                // Handle the error appropriately here
                print("Error fetching top headline articles: \(error)")
            }
        }
 
    }
    
    
    
    func fetchTopHeadlineArticles() async throws {
        let articles: ArticleResponse = try await NetworkService.shared.fetchArticles(url: URLConstants.articleTopHeadlineUrl)
        self.topHeadlineArticles = articles.articles
        print("SUCCESS")
    }

    //    func fetchArticleByCategory() async throws {
    //
    //        Task { @MainActor in
    //            let articles : ArticleResponse = try await NetworkService.shared.fetchArticles(url: URLConstants.articleByCategoryUrl(category: selectedCategory))
    //            self.articlesByCategory = articles.articles
    //        }
    //
    //    }
    
    
}
