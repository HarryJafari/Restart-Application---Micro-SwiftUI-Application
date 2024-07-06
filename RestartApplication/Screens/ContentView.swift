//
//  ContentView.swift
//  RestartApplication
//
//  Created by Reza on 5/7/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnBoardingView()
            }else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
