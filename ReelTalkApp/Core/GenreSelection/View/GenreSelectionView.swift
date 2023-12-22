//
//  GenreSelectionView.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/19/23.
//

import SwiftUI

struct GenreSelectionView: View {
    @ObservedObject var genreViewModel = GenreSelectionViewModel()
    @State private var showMoviesView = false
    @State private var selectedGenres: Set<String> = Set()

        var numGenreSelected: Int {
            selectedGenres.count
        }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(#colorLiteral(red: 0.134, green: 0.134, blue: 0.134, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                // Stack for page indicators, text, and numGenresSelected
                VStack(alignment: .center) {
                    VStack {
                        HStack(alignment: .bottom) {
                            Rectangle()
                                .frame(width: 80, height: 5)
                                .cornerRadius(5)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)))
                            Rectangle()
                                .frame(width: 80, height: 5)
                                .cornerRadius(5)
                                .foregroundColor(.gray)
                            Rectangle()
                                .frame(width: 80, height: 5)
                                .cornerRadius(5)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom,30)
                    }
                    
                    Text("Select your top 3 genres for movies and TV")
                        .font(.custom("AvenirNext-DemiBold", size: 28))
                        .multilineTextAlignment(.center)
                        .frame(width: 350, height: 80)
                        .kerning(-0.05)
                        .foregroundColor(.white)
                    
                    Text("\(numGenreSelected)/3 selected")
                        .font(.custom("AvenirNext-Medium", size: 15))
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                        .kerning(0.2)
                        .foregroundColor(.white)
                    
                    List {
                        ForEach(genreViewModel.genres.flatMap { $0.filteredResults }, id: \.self) { genre in
                            Button(action: {
                                if selectedGenres.contains(genre) {
                                    // If Genre is already selected, remove from numGenreSelected
                                    selectedGenres.remove(genre)
                                } else if numGenreSelected < 3 {
                                    //If there are fewer than 3 selected genres, add to numGenreSelected
                                    selectedGenres.insert(genre)
                                } else {
                                    //If user tries to select more than 3 genres
                                    print("You can only select up to 3 genres.")
                                }
                            }) {
                                Text(genre)
                                    .font(.custom("AvenirNext-Medium", size: 20))
                                    .kerning(0.05)
                                    .foregroundColor(selectedGenres.contains(genre) ? .black : .white)
                                    .padding(.horizontal, 30)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white, lineWidth: 1)
                                            .background(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .foregroundColor(selectedGenres.contains(genre) ? Color.white : Color.clear)
                                            )
                                    )
                            }
                            .listRowBackground(Color.clear)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .frame(width: 350, height: 500)
                    
                    Button(action: {
                        if selectedGenres.count == 3 {
                            showMoviesView = true
                            print("Genre continue button pushed")
                        } else {
                            print("Please select 3 genres before continuing")
                        }
                    }) {
                        Text("Continue")
                            .frame(width: 300)
                            .font(.custom("AvenirNext-DemiBold", size: 17))
                            .kerning(-0.05)
                            .foregroundColor(.black)
                            .padding()
                            .background(selectedGenres.count == 3 ? Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)) : Color.gray)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .navigationDestination(isPresented: $showMoviesView) {
                TopMoviesView()
            }
        } .onAppear {
            genreViewModel.getGenres()
        }
    }
}
    
#Preview {
    GenreSelectionView()
}
