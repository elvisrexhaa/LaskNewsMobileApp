//
//  FilteredArticleCategory.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

enum FilteredCategory: String, Identifiable, CaseIterable {
    
    case business = "Business"
    case entertainment = "Entertainment"
    case general = "General"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
    
    var id: String { self.rawValue }
    
    
    
}

struct FilteredArticleCategory: View {
    
    @Binding var activeCategory: FilteredCategory
    @Namespace private var animation
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(FilteredCategory.allCases) { category in
                        Button {
                            withAnimation(.snappy) {
                                activeCategory = category
                                proxy.scrollTo(category, anchor: .center)
                            }
                        } label: {
                            Text(category.rawValue)
                                .foregroundStyle(.black)
                                .bold()
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
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.activeFilteredCategory, lineWidth: 1)
                                        }
                                    }
                                }
                        }
                        .id(category)
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 8)
            }
        }
    }
}

#Preview {
    FilteredArticleCategory(activeCategory: .constant(.business))
}
