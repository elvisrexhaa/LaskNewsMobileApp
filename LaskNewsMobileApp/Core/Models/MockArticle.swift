//
//  Article.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import Foundation


enum ArticleCategory: String, Decodable {
    case technology = "Technology"
    case science = "Science"
    case sports = "Sports"
    
    
    
}

struct MockArticle: Identifiable, Decodable {
    var id: UUID = .init()
    var articleImage: String
    var articleTitle: String
    var articleCateogory: ArticleCategory
    
}


extension MockArticle {
    static func mockArticles() -> [MockArticle] {
        
        return [
            MockArticle(articleImage: "articleCardImage", articleTitle: "Experience the Serenity of Japan's", articleCateogory: .technology),
            MockArticle(articleImage: "articleCardImage2", articleTitle: "Discovering the Magic of Paris: A Journey through", articleCateogory: .technology),
            MockArticle(articleImage: "articleCardImage", articleTitle: "Experience the Serenity of Japan's", articleCateogory: .technology),
            MockArticle(articleImage: "articleCardImage2", articleTitle: "Discovering the Magic of Paris: A Journey through", articleCateogory: .technology)

        ]
    }
}

