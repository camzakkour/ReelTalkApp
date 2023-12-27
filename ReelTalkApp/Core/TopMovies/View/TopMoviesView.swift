//
//  TopMoviesView.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/19/23.
//

import SwiftUI

struct TopMoviesView: View {
    @ObservedObject var movieViewModel = TopMoviesViewModel()
    @State private var showShowsView = false
    @State private var selectedMovies: Set<String> = Set()
    @State private var searchText = ""
    
    var numMoviesSelected: Int {
        selectedMovies.count
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(#colorLiteral(red: 0.134, green: 0.134, blue: 0.134, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                // Stack for page indicators, text, and numMoviesSelected
                VStack {
                    VStack {
                        HStack(alignment: .bottom) {
                            Rectangle()
                                .frame(width: 80, height: 5)
                                .cornerRadius(5)
                                .foregroundColor(.gray)
                            Rectangle()
                                .frame(width: 80, height: 5)
                                .cornerRadius(5)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)))
                            Rectangle()
                                .frame(width: 80, height: 5)
                                .cornerRadius(5)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom,20)
                    }
                    
                    Text("Select your top 5 movies")
                        .font(.custom("AvenirNext-Bold", size: 28))
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 80)
                        .kerning(-0.05)
                        .foregroundColor(.white)
                    
                    Text("\(numMoviesSelected)/5 selected")
                        .font(.custom("AvenirNext-Medium", size: 15))
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                        .kerning(0.2)
                        .foregroundColor(.white)
                    
                    SearchBarView(searchText: $searchText)
                    
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 5),
                            GridItem(.flexible(), spacing: 5)
                        ], spacing: 10) {
                            ForEach(movieViewModel.movies.flatMap(\.results).filter {
                                searchText.isEmpty || $0.originalTitleText.text.localizedCaseInsensitiveContains(searchText)
                            }, id: \.originalTitleText.text) { movie in
                                Button(action: {
                                    if selectedMovies.contains(movie.originalTitleText.text) {
                                        // If movie is already selected, remove from numMovieSelected
                                        selectedMovies.remove(movie.originalTitleText.text)
                                    } else if numMoviesSelected < 5 {
                                        //If there are fewer than 5 selected movies, add to numMoviesSelected
                                        selectedMovies.insert(movie.originalTitleText.text)
                                    } else {
                                        //If user tries to select more than 5 movies
                                        print("You can only select up to 5 movies.")
                                    }
                                }) {
                                    MoviesCardView(movie: movie, isSelected: selectedMovies.contains(movie.originalTitleText.text))
                                }
                            }
                        }
                    }
                    .frame(width: 350, height: 450)
                    
                    Button(action: {
                        if selectedMovies.count == 5 {
                            showShowsView = true
                            print("Movie continue button pushed")
                        } else {
                            print("Please select 5 movies before continuing")
                        }
                    }) {
                        Text("Continue")
                            .frame(width: 300)
                            .font(.custom("AvenirNext-DemiBold", size: 17))
                            .kerning(-0.05)
                            .foregroundColor(.black)
                            .padding()
                            .background(selectedMovies.count == 5 ? Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)) : Color.gray)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .navigationDestination(isPresented: $showShowsView) {
                TopShowsView()
            }
        } .onAppear {
            movieViewModel.getMovies()
        }
    }
}

#Preview {
    TopMoviesView()
}
