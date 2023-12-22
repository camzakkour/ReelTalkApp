//
//  SplashScreenView.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/19/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.7
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color(#colorLiteral(red: 0.134, green: 0.134, blue: 0.134, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                //Stack for img, title, and by me
                VStack {
                    VStack(spacing: 10) {
                        Image("SplashImg")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                        Text("REEL TALK")
                            .font(.custom("AvenirNext-DemiBold", size: 28))
                            .kerning(-0.05)
                            .foregroundColor(.white)
                        Text("By Cam Zakkour")
                            .font(.custom("AvenirNext-regular", size: 15))
                            .kerning(0.2)
                            .foregroundColor(.white)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 1.0
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
