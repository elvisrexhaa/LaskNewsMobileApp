//
//  CacheManager.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 24/05/2024.
//

import Foundation
import SwiftUI

class CacheManager: ObservableObject {
    
    static let shared = CacheManager()
    @Published var uimage: UIImage?
    let cacheKey = "stored_image"
    
    private var cache = NSCache<NSString, UIImage>()
    
    init() {
        cache.totalCostLimit = 50
        cache.countLimit = 10
    }
    
    private func storeImageInCache(uiImage: UIImage, key: String) {
        cache.setObject(uiImage, forKey: key as NSString)
    }
    
    private func fetchImageFromCache(key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
    
    @MainActor
    func fetchImage(url: String) async throws {
        
        guard let url = URL(string: url) else {
            throw APIError.invalidUrl
        }
        
        if let cachedData = fetchImageFromCache(key: url.absoluteString) {
            self.uimage = cachedData
        }
        
        do {
            let(data, _) = try await URLSession.shared.data(from: url)
            guard let imageData = UIImage(data: data) else {
                throw APIError.dataNotFound
            }
            
            storeImageInCache(uiImage: imageData, key: url.absoluteString)
            
            self.uimage = imageData
        } catch {
            print(error.localizedDescription)
            
        }
        
    }
    
    
}
