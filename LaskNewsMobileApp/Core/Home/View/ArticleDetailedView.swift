//
//  ArticleDetailedView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

struct ArticleDetailedView: View {
    
    @Binding var showTabBar: Bool
    @Binding var selectedArticle: Article?
    let article: Article
    
    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size
                
                
                Image(article.articleImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height * 0.2)
                
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(height: getRect().height * 0.72)
                .foregroundStyle(.white)
                .overlay(alignment: .topLeading) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("See How the Forest is Helping Our World")
                                .bold()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                            HStack {
                                Circle()
                                    .frame(width: 20, height: 20)
                                
                                Text("Harry Harper · Apr 12, 2023")
                                    .font(.caption)
                                    .foregroundStyle(Color(.systemGray2))
                                
                            }
                            .padding(.bottom)
                            
                            Text("Forests are one of the most important natural resources that our planet possesses. Not only do they provide us with a diverse range of products such as timber, medicine, and food, but they also play a vital role in mitigating climate change and maintaining the overall health of our planet's ecosystems. In this article, we will explore the ways in which forests are helping our world. One of the most important roles that forests play is in absorbing carbon dioxide from the atmosphere. Trees absorb carbon dioxide through photosynthesis and store it in their trunks, branches, and leaves. This carbon sequestration helps to mitigate climate change by reducing the amount of greenhouse gases in the atmosphere. Forests are estimated to absorb approximately 2.4 billion tonnes of carbon dioxide each year, which is equivalent to around 10% of global greenhouse gas emissions. Forests also play a crucial role in maintaining the water cycle. Trees absorb water from the soil and release it back into the atmosphere through a process known as transpiration. This helps to regulate the local climate and prevents soil erosion and flooding. Forests also act as natural water filters, helping to purify water that flows through them. Forests are also important sources of biodiversity. They provide habitat for countless species of plants and animals, many of which are found nowhere else on earth. Forests also provide a source of food and medicine for many communities around the world. In fact, it is estimated that around 80% of the world's population relies on traditional medicine derived from plants, many of which are found in forests. In addition to their ecological and cultural importance, forests also provide economic benefits. They provide jobs and income for millions of people around the world, particularly in rural areas. Forests also provide timber, paper, and other products that are essential to many industries.")
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
    ArticleDetailedView(showTabBar: .constant(false) ,selectedArticle: .constant(Article.mockArticles()[0]), article: Article.mockArticles()[0])
}
