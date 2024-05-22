//
//  SplashScreenView.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

var totalPages = 2

struct SplashScreenView: View {
    
    @AppStorage("currentPage") private var currentPage = 1
    
    var body: some View {
        ZStack {
            if currentPage == 1 {
                SplashScreenPage()
                    .transition(.slide.combined(with: .blurReplace()))
    
            }
            
            if currentPage == 2 {
                WelcomeView()
                    .transition(.slide.combined(with: .blurReplace()))
                    
            }
            
            if currentPage == 3 {
                HomeView()
                    .transition(.slide.combined(with: .blurReplace()))
                    
            }
        }
        .animation(.smooth, value: currentPage)
    }
}

#Preview {
    SplashScreenView()
}


struct SplashScreenPage: View {
    
    @AppStorage("currentPage") private var currentPage = 1
    
    var body: some View {
        ZStack {
            Color.splashscreenBg.ignoresSafeArea()
            
            VStack {
                Text("LASK")
                    .font(.system(size: 60))
                    .foregroundStyle(.brandColor1).bold()
                    .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
                
                Button {
                    withAnimation(.smooth) {
                        if currentPage < totalPages {
                            currentPage += 1
                        }
                    }
                } label: {
                    Text("Get Started")
                        .padding()
                        .background(.brandColor1, in: RoundedRectangle(cornerRadius: 10))
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
                        .foregroundStyle(.white).bold()
                }
            }
            
            
        }
    }
}

#Preview {
    SplashScreenPage()
}
