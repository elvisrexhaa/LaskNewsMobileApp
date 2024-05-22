//
//  WelcomeView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI



struct WelcomeView: View {
    @AppStorage("currentPage") private var currentPage = 2
    var totalPages: Int = 2
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.welcomeLinear1, .welcomeLinear2], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Image(.welcomeBg)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
                    .foregroundStyle(.white)
                    .overlay {
                        VStack(spacing: 14) {
                            Text("Get The Latest News\nAnd Updates")
                                .bold()
                                .font(.title)
                                
                            
                            Text("From Politics to Entertainment: Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Glob will be right on your hand.")
                                .foregroundStyle(Color(.systemGray3))
                            
                            Button {
                                withAnimation(.smooth) {
                                    if currentPage <= totalPages {
                                        currentPage += 1
                                    }
                                }
                            } label: {
                                HStack {
                                    Text("Explore")
                                    Image(systemName: "arrow.right")
                                }
                                .padding()
                                .background(.brandColor1, in: RoundedRectangle(cornerRadius: 30))
                                .foregroundStyle(.white).bold()
                            }
                        }
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 60)
                    }
            }
            
            
            
            
        }
    }
}

#Preview {
    WelcomeView()
}
