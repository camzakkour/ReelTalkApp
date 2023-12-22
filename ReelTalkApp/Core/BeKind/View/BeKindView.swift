//
//  BeKindView.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/18/23.
//

import SwiftUI

struct BeKindView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            // Stack for all the text + button
            VStack(alignment: .leading, spacing: 20) {
                Text("🚧 Keep it reel, but be kind")
                    .font(.custom("AvenirNext-Bold", size: 34))
                    .kerning(-0.05)
                    .foregroundColor(.white)
                
                Text("Welcome, we’re so excited to have you here!\n\nAt Reel Talk, we believe that every individual brings something unique to our community. We are committed to fostering a safe and respectful troll-free environment for everyone to engage in exciting conversations.\n\nIn our mission to encourage respect, we ask that you join us by adhering to our guidelines - \(Text("no cyber-bullying or inappropriate content").bold()). Failure to adhere to them may result in being banned from our community. Thanks for your cooperation.\n\nWith love,\nThe Reel Talk Team")
                    .font(.custom("AvenirNext-Medium", size: 17))
                    .kerning(0.2)
                    .foregroundColor(.white)
                
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    
                    Button(action: {
                        print("I agree button tapped")
                    }) {
                        Text("I agree")
                            .frame(width: 300)
                            .font(.custom("AvenirNext-DemiBold", size: 17))
                            .kerning(-0.05)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)))
                            .cornerRadius(10)
                            
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    BeKindView()
}
