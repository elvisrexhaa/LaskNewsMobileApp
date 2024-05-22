//
//  FilteredArticleCategory.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

enum FilteredCategory: String, CaseIterable {
    case travel = "Travel"
    case technology = "Technology"
    case entertainment = "Entertainment"
    case business = "Business"
}



struct FilteredArticleCategory: View {
    
    @Binding var activeCategory: FilteredCategory
    @Namespace private var animation
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(FilteredCategory.allCases, id: \.rawValue) { category in
                    Button {
                        withAnimation(.snappy) {
                            activeCategory = category
                        }
                    } label: {
                        Text(category.rawValue)
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 16)
                            .background {
                                ZStack {
                                    if activeCategory == category {
                                        Color.activeFilteredCategory
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .matchedGeometryEffect(id: "ACTIVECATEGORY", in: animation)
                                    } else {
                                        Color.activeFilteredCategory
                                            .clipShape(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1))
                                          
                                    }
                                        
                                    
                                }
                                
                            }
                            
                    }
                    
                }
            }
            .padding(.horizontal)
            .padding(.leading, 8)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    FilteredArticleCategory(activeCategory: .constant(.business))
}
