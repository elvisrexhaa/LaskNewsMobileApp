//
//  ArticleDetailedView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI
import Kingfisher

struct ArticleDetailedView: View {
    
    @Binding var showTabBar: Bool
    @Binding var selectedArticle: Article?
    let article: Article
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size
                
                if let imageUrl = article.urlToImage {
                    KFImage(URL(string: imageUrl))
                        .resizable()
        //                .matchedGeometryEffect(id: article.id, in: animation)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height * 1.2)
                        .ignoresSafeArea()

                }

            }
            .frame(height: 230)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(height: getRect().height * 0.7)
                .foregroundStyle(.white)
                .overlay(alignment: .topLeading) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(article.title)
                                .bold()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                            HStack {
                                Circle()
                                    .frame(width: 20, height: 20)
                                
                                Text(article.author ?? "")
                                    .font(.caption)
                                    .foregroundStyle(Color(.systemGray2))
                                
                            }
                            .padding(.bottom)
                            
                            Text(article.content ?? "")
                                .fontDesign(.serif)
                            
                            
                        }
                        .padding()
                    }
                }
            
            
            
            
            
        }
        
        
        
        
        .overlay(alignment: .bottom) {
            ZStack {
                
                
                
                
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 70)
                    .foregroundStyle(.articleBottomFooter).opacity(0.9)
                
                HStack {
                    Image(systemName: "arrow.left")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .onTapGesture {
                            withAnimation(.smooth) {
                                selectedArticle = nil
                                showTabBar = true
                            }
                        }
                    
                    
                    Image(systemName: "bookmark")
                    
                    Image(systemName: "arrowshape.turn.up.right")
                        .padding(.leading)
                }
                .padding(.horizontal, 40)
                .fontWeight(.semibold)
            }
            
            
        }
        .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        
        
        
        
    }
}

#Preview {
    ArticleDetailedView(showTabBar: .constant(false) ,selectedArticle: .constant(Article.init(title: "", author: "", url: "", urlToImage: "", publishedAt: "", content: "")), article: Article(title: "deiuwhiuewhiuehfiuhewiufhewiufheiudeniuwehiufhweiuhfiuweh", author: "efwdewfwfwedwefefewfwefewf", url: "", urlToImage: "https://a2.espncdn.com/combiner/i?img=%2Fphoto%2F2020%2F0530%2Fr703805_1296x729_16%2D9.jpg", publishedAt: "", content: "isdehuybewudfehwuyedghjuwebfuywbeuyeuwyhfiuyhweiuhiuwgheiuhwieuhtiwehiufhweiufwefuhiuewhiuhiufhiuwehfuewhfiuehwidewhfuwiuefhiuehiuehwgeiuwiuewhiugehwiufhiuhewfiuehwfiuheiuwhfeiuwhfiuehwdinweiufhiuehwiuhweiguhwefnfdyweiufhewiufhweiufhiuwehfiuehwgiuyhewiufdeiuwhfeiuwheiuhgiuewhgiuehwighewiuehiuwhiugihughiuhiuhiuhiuhiuhiuhiuhiuhiuihuhiuhiuhiuhiuhiuhiuhiuhiuhiuhiueiuwhdiuewhfniufgiewhuehwiufhvjwecnbiuhiuhiuhgiuweghiuweghiug"), animation: Namespace().wrappedValue)
}
