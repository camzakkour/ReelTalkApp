//
//  MoviesCardView.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/20/23.
//

import SwiftUI

struct MoviesCardView: View {
    
    // to remove comma from year
    let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .none
            return formatter
        }()
    
    let movie: TopMoviesModel
    let isSelected: Bool
    
    var body: some View {
        
        // stack for movie image and movie title/year
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: movie.primaryImage.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .border(isSelected ? Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)) : Color.clear, width: 5)
                    .overlay(
                        ZStack {
                            if isSelected {
                                Circle()
                                    .fill(Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)))
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.black)
                                    )
                                    .offset(x: 45, y: -85)
                            }
                        }
                    )
            } placeholder: {
                ProgressView()
            }
            Text("\(movie.originalTitleText.text) (\(numberFormatter.string(from: NSNumber(value: movie.releaseYear.year))!))")
                .font(.custom("AvenirNext-Medium", size: 15))
                .multilineTextAlignment(.center)
                .kerning(0.2)
                .foregroundColor(.white)
        }
        .frame(width: 150)
    }
}
