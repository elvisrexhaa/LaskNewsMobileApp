//
//  ArticleRowCardView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 23/05/2024.
//

import SwiftUI
import Kingfisher

struct ArticleRowCardView: View {
    
    var article: Article
    @State private var offset: CGSize = .zero
    private let maxOffset: CGFloat = 80
    @State private var showBookmark: Bool = false
    var onBookmarkPressed: (() -> ())?
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(article.title)
                    .bold()
                    .font(.title3)
                    .lineLimit(2)
                    .frame(width: 240, alignment: .leading)
                
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    
                    Text("\(article.author ?? "") . \(article.publishedAt)")
                        .foregroundStyle(Color(.systemGray4))
                        .font(.caption)
                    
                    
                }
            }

            if let imageUrl = article.urlToImage {
               ImageLoader(url: imageUrl, width: 112, height: 80)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 112, height: 80)
                    .foregroundStyle(.clear)
                    .overlay {
                        ProgressView()
                            .tint(.brandColor1)
                            .font(.title3)
                    }
            }
            
            if showBookmark {
                Image(systemName: "bookmark")
                    .transition(.blurReplace)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            onBookmarkPressed?()
                        }
                    }
            }

        }
        .offset(offset)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding(.horizontal)
        .gesture(
            DragGesture()
                .onChanged{ value in
                    onChnaged(value)
                    
                }
                .onEnded({ value in
                    onEnded(value)
                })
        
        )
    }
    
    private func onChnaged(_ value: DragGesture.Value) {
        let newOffset  = CGSize(width: value.translation.width, height: 0)
        
        withAnimation(.snappy) {
            offset = CGSize(width: min(max(-maxOffset + 40, newOffset.width), 0), height: 0)
        }
    }
    
    private func onEnded(_ value: DragGesture.Value) {
        withAnimation(.snappy) {
            if value.translation.width < -50 {
                offset = CGSize(width: -maxOffset + 70, height: 0)
                showBookmark = true
            } else {
                offset = .zero
                showBookmark = false
            }
        }
    }
}

#Preview {
    ArticleRowCardView(article: Article(title: "dewfefniubneudhniuefhwiuhefiuhewiufeiuhwe", author: "efwwuefhihwueifhu", url: "", urlToImage: "https://ichef.bbci.co.uk/news/1024/branded_news/ddad/live/10802f80-19a1-11ef-8810-7ddce6503835.jpg", publishedAt: "", content: ""))
}
