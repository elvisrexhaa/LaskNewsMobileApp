//
//  NetworkService.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 23/05/2024.
//

import Foundation

protocol FetchArticlesByCategory {
    func fetchArticles<T:Decodable>(url: String) async throws -> T
}


class NetworkService: FetchArticlesByCategory {
    
    static let shared  = NetworkService()
    
    func fetchArticles<T>(url: String) async throws -> T where T : Decodable {
        guard let url = URL(string: url) else {
            throw APIError.invalidUrl
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidHttpResponse
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse(httpResponse.statusCode)
            }
            
            do {
                let returnedData = try JSONDecoder().decode(T.self, from: data)
                return returnedData
            } catch {
                throw APIError.decodingError(error)
            }
            
        } catch {
            throw APIError.dataNotFound
        }
        
        
        
        
        
        
    }
    
    
    func fetchArticles2() async throws -> [Article] {
        guard let url = URL(string: URLConstants.articleTopHeadlineUrl) else {
            throw APIError.invalidUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let articles = try JSONDecoder().decode(ArticleResponse.self, from: data)
            return articles.articles
        } catch {
            throw APIError.decodingError(error)
        }
        
    }

}
