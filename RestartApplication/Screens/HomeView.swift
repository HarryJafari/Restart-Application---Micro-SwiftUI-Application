//
//  HomeView.swift
//  RestartApplication
//
//  Created by Reza on 5/7/2024.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack {
            Spacer()
            //header
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                    Animation.easeInOut(duration: 4)
                        .repeatForever(),
                    value: isAnimating)
            }
            
            //center
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                 .multilineTextAlignment(.center)
                 .padding()
            
            
            //footer
            Spacer()
            
            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnBoardingViewActive = true
                }
               
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                    
                
                Text("Restart")
                    .font(.system(.title3 , design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
            
            
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
