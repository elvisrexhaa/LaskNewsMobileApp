//
//  BookmarkView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 23/05/2024.
//

import SwiftUI

struct BookmarkView: View {
    
    @State private var editBookmark: Bool = false
    
    var body: some View {
        VStack {
            bookmarkHeader(editBookmark: $editBookmark)
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(0..<10) { _ in
                        HStack {
                            ArticleRowCardView()
                            
                            if editBookmark {
                                Image(systemName: "bookmark")
                            }
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    BookmarkView()
}



@ViewBuilder
private func bookmarkHeader(editBookmark: Binding<Bool>) -> some View {
    HStack {
        Text("Bookmark")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
        ZStack {
            if editBookmark.wrappedValue {
                Text("Done")
            } else {
                Image(systemName: "pencil.line")
            }
        }
        .onTapGesture {
            withAnimation(.snappy) {
                editBookmark.wrappedValue.toggle()
            }
        }
        
        
    }
    .bold()
    .padding()
//    .padding(.horizontal, 10)
    .background(.activeFilteredCategory)
    
}
