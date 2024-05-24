//
//  LaskNewsMobileAppApp.swift
//  LaskNewsMobileApp
//
//  Created by Elvis Rexha on 22/05/2024.
//

import SwiftUI

@main
struct LaskNewsMobileAppApp: App {
    
    @StateObject var exploreViewModel = ExploreViewModel()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(exploreViewModel)
        }
    }
}
