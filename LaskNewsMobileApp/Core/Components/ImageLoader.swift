//
//  ImageUploader.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 24/05/2024.
//

import SwiftUI
import Kingfisher

struct ImageLoader: View {
    
    @State private var cacheManager: CacheManager = CacheManager()
    var url: String
    
    var body: some View {
        
        VStack {
            if let image = cacheManager.uimage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100) // Adjust size as needed
            } else {
                // Placeholder or loading indicator
                Text("Loading...")
            }
           
        }
        .onAppear {
            Task {
                do {
                    try await cacheManager.fetchImage(url: url)
                } catch {
                    print("Failed to fetch image: \(error.localizedDescription)")
                }
            }
        }
        
        
        
        
           
    }
}

#Preview {
    ImageLoader(url: "https://ichef.bbci.co.uk/news/1024/branded_news/ddad/live/10802f80-19a1-11ef-8810-7ddce6503835.jpg")
}
