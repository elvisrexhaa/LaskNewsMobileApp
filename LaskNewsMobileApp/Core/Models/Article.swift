//
//  Article.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import Foundation


enum ArticleCategory: String {
    case technology = "Technology"
    case science = "Science"
    case sports = "Sports"
    
    
    
}

struct Article: Identifiable {
    var id: UUID = .init()
    var articleImage: String
    var articleTitle: String
    var articleCateogory: ArticleCategory
    
}


extension Article {
    static func mockArticles() -> [Article] {
        
        return [
            Article(articleImage: "articleCardImage", articleTitle: "Experience the Serenity of Japan's", articleCateogory: .technology),
            Article(articleImage: "articleCardImage2", articleTitle: "Discovering the Magic of Paris: A Journey through", articleCateogory: .technology)

        ]
    }
}

