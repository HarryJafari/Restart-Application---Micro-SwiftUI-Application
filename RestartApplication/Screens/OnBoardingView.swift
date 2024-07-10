//
//  OnBoardingView.swift
//  RestartApplication
//
//  Created by Reza on 5/7/2024.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onboarding") var isOnBoardingActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var imageOffset: CGSize = .zero
    @State private var indicateorIpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    @State private var inAnimating: Bool = false

    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea()
            VStack(spacing: 20) {
               // MARK: - Header
                Spacer()
                VStack {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle)
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
                .opacity(inAnimating ? 1 : 0)
                .offset(y: inAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1) , value: inAnimating)
                // MARK: - Center
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(inAnimating ? 1 : 0)
                        .animation(.easeOut, value: inAnimating)
                        .offset(x: imageOffset.width * 1.2 , y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20 )))
                        .gesture(DragGesture().onChanged{ gestuer in
                            if abs(imageOffset.width) <= 150 {
                                imageOffset = gestuer.translation
                                withAnimation(.linear(duration: 0.25)) {
                                    indicateorIpacity = 0
                                    textTitle = "Give."
                                }
                            }
                            
                        }.onEnded{ _ in
                            imageOffset = .zero
                            withAnimation(.linear(duration: 0.25)) {
                                indicateorIpacity = 1
                                textTitle = "Share."
                            }
                            
                        })
                        .animation(.easeOut(duration: 1),value: imageOffset)
                }//end of ztack
                .overlay(Image(systemName: "arrow.left.and.right.circle")
                    .font(.system(size: 44, weight: .ultraLight))
                    .foregroundColor(.white)
                    .offset(y:20)
                    .opacity(inAnimating ? 1 : 0)
                    .animation(.easeOut(duration: 1).delay(2), value: inAnimating)
                    .opacity(indicateorIpacity)
                         , alignment: .bottom
                )
                Spacer()
                // MARK: - Footer
                
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
                            .frame(width:buttonOffset + 80)
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
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                        buttonOffset = gesture.translation.width
                                    }
                                    
                                }
                                .onEnded { _ in
                                    
                                    withAnimation(.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            hapticFeedback.notificationOccurred(.success)
                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffset = buttonWidth - 80
                                            isOnBoardingActive = false
                                        }else
                                        {
                                            hapticFeedback.notificationOccurred(.warning)
                                            buttonOffset = 0
                                        }
                                    }
                                   
                                    
                                }
                        )
                        
                        Spacer()
                    }
                    
                    
                }//end od footer
                .frame(width: buttonWidth,height: 80 , alignment: .center)
                .padding()
                .opacity(inAnimating ? 1 : 0)
                .offset(y: inAnimating ? 0 : 40)
                .animation(.easeIn(duration: 1) , value: inAnimating)
            }//:E VStack
        }//:E ZStack
        .onAppear(perform: {
            inAnimating = true
        })
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    OnBoardingView()
}
