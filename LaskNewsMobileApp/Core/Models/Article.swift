//
//  Article.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 23/05/2024.
//

import Foundation
import SwiftUI

struct ArticleResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let author: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
