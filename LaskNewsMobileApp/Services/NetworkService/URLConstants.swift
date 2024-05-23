//
//  URLConstants.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 23/05/2024.
//

import Foundation


struct URLConstants {
    
    //MARK: Endpoint URLs...
    
    static let apiKey = "3c2b12ea91b94539a2a848e0a164d199"
    
    
    static var articleTopHeadlineUrl: String {
        return "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
    }
    
    static func articleByCategoryUrl(category: FilteredCategory) -> String {
        return "https://newsapi.org/v2/top-headlines?category=\(category)&apiKey=\(apiKey)"
    }

}
