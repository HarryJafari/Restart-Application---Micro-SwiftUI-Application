//
//  OnBoardingView.swift
//  RestartApplication
//
//  Created by Reza on 5/7/2024.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onboarding") var isOnBoardingActive: Bool = true
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea()
            VStack(spacing: 20) {
               // Header
                Spacer()
                VStack {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
its not showing much we give but
how much i giove you put into your
""")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    
                    
                }//end of vstack
                //Cente
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }//end of ztack
                Spacer()
                //Footer
                
                ZStack {
                    //part 1
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2)).padding(8)
                    
                    //part 2
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                   // part 3
                    HStack {
                        Capsule()
                            .fill(Color.red.opacity(0.8))
                            .frame(width: 80)
                        Spacer()
                    }
                   // part 4
                    
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24 , weight: .bold
                                             ))
                        }
                        .foregroundColor(.white)
                        .frame(height: 80 , alignment: .center)
                        .onTapGesture {
                            isOnBoardingActive = false
                        }
                        
                        Spacer()
                    }
                    
                    
                }//end od footer
                .frame(height: 80 , alignment: .center)
                .padding()
            }//:E VStack
        }//:E ZStack
    }
}

#Preview {
    OnBoardingView()
}
