//
//  APIError.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 23/05/2024.
//

import Foundation


enum APIError: Error {
    
    case invalidUrl
    case invalidHttpResponse
    case invalidResponse(Int)
    case dataNotFound
    case decodingError(Error)
    
    var errorDescription: String {
        switch self {
        case .invalidUrl:
            return "Invalid Url, please try again"
        case .invalidResponse(let statusCode):
            return "Invalid Response: \(statusCode)"
        case .dataNotFound:
            return "Data could not be found"
        case .decodingError(let error):
            return "There was an issue decoding the following data: \(error)"
        case .invalidHttpResponse:
            return "Invalid HTTP Response"
        }
    }
    
    
}
