//
//  WelcomeView.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/18/23.
//

import SwiftUI

struct WelcomeView: View {
    var pageIndex: Int
    var totalPageCount: Int
    var page: Page

    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.134, green: 0.134, blue: 0.134, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            //Stack for img and page description text
            VStack {
                Image("\(page.imageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .padding()
                    .background(.white.opacity(0.87))
                    .cornerRadius(20)

                Text(page.Description)
                    .font(.custom("AvenirNext-Medium", size: 15))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .kerning(0.2)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}
