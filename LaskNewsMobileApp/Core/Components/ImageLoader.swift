//
//  ImageUploader.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 24/05/2024.
//

import SwiftUI


struct ImageLoader: View {
    
    @StateObject private var cacheManager = CacheManager()
    var url: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack {
            if let uiImage = cacheManager.uimage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: width, height: height)
                    .clipShape(.rect(cornerRadius: 8))
            }
            
        }
        .task {
            do {
                try await cacheManager.fetchImage(url: url)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ImageLoader(url: "https://ichef.bbci.co.uk/news/1024/branded_news/ddad/live/10802f80-19a1-11ef-8810-7ddce6503835.jpg", width: 112, height: 80)
}
