//
//  TopShowsView.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/19/23.
//

import SwiftUI

struct TopShowsView: View {
    @ObservedObject var showViewModel = TopShowsViewModel()
    @State private var showBeKindView = false
    @State private var selectedShows: Set<String> = Set()
    @State private var searchText = ""
    
    var numShowsSelected: Int {
        selectedShows.count
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(#colorLiteral(red: 0.134, green: 0.134, blue: 0.134, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                // Stack for page indicators, text, and numShowssSelected
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
                                .foregroundColor(.gray)
                            Rectangle()
                                .frame(width: 80, height: 5)
                                .cornerRadius(5)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)))
                        }
                        .padding(.bottom,20)
                    }
                    
                    Text("Select your top 5 shows")
                        .font(.custom("AvenirNext-Bold", size: 28))
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 80)
                        .kerning(-0.05)
                        .foregroundColor(.white)
                    
                    Text("\(numShowsSelected)/5 selected")
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
                            ForEach(showViewModel.shows.flatMap(\.results).filter {
                                searchText.isEmpty || $0.originalTitleText.text.localizedCaseInsensitiveContains(searchText)
                            }, id: \.originalTitleText.text) { show in
                                Button(action: {
                                    if selectedShows.contains(show.originalTitleText.text) {
                                        // If show is already selected, remove from numShowSelected
                                        selectedShows.remove(show.originalTitleText.text)
                                    } else if numShowsSelected < 5 {
                                        //If there are fewer than 5 selected shows, add to numShowsSelected
                                        selectedShows.insert(show.originalTitleText.text)
                                    } else {
                                        //If user tries to select more than 5 shows
                                        print("You can only select up to 3 movies.")
                                    }
                                }) {
                                    ShowsCardView(show: show, isSelected: selectedShows.contains(show.originalTitleText.text))
//                                        .padding()
                                }
                            }
                        }
                    }
                    .frame(width: 350, height: 450)
                    
                    Button(action: {
                        if selectedShows.count == 5 {
                            showBeKindView = true
                            print("Shows continue button pushed")
                        } else {
                            print("Please select 5 shows before continuing")
                        }
                    }) {
                        Text("Continue")
                            .frame(width: 300)
                            .font(.custom("AvenirNext-DemiBold", size: 17))
                            .kerning(-0.05)
                            .foregroundColor(.black)
                            .padding()
                            .background(selectedShows.count == 5 ? Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)) : Color.gray)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .navigationDestination(isPresented: $showBeKindView) {
                BeKindView()
            }
        } .onAppear {
            showViewModel.getShows()
        }
    }
}

#Preview {
    TopShowsView()
}
