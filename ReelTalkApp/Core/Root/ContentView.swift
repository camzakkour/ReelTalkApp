//
//  ContentView.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotApperance = UIPageControl.appearance()
    @State private var showGenreView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(#colorLiteral(red: 0.134, green: 0.134, blue: 0.134, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                // TabView for WelcomeView and dot/page indicator
                VStack(spacing: 10) {
                    TabView(selection: $pageIndex) {
                        ForEach(pages) { page in
                            WelcomeView(pageIndex: pageIndex, totalPageCount: pages.count, page: page)
                                .tag(page.tag)
                        }
                    }
                    .animation(.easeInOut, value: pageIndex)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                    .tabViewStyle(PageTabViewStyle())
                    .onAppear {
                        dotApperance.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)
                        dotApperance.pageIndicatorTintColor = .white
                    }
                    .padding(.bottom, 100)
                    
                    // Continue button and login text
                    VStack(spacing: 20) {
                        if pages[pageIndex] == pages.last {
                            Button("Continue", action: {
                                showGenreView = true
                                print("Continue button pushed")
                            })
                            .frame(width: 300)
                            .font(.custom("AvenirNext-DemiBold", size: 17))
                            .kerning(-0.05)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1)))
                            .cornerRadius(10)
                            .padding()
                        }
                        
                        Text("Already have an account? \(Text("Log in").foregroundColor(Color(#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1411764706, alpha: 1))))")
                            .font(.custom("AvenirNext-DemiBold", size: 17))
                            .kerning(-0.05)
                            .foregroundColor(.white)
                            .padding(.bottom , 30)
                    }
                    .padding(.bottom, 30)
                    .frame(width: 300, height: 50)
                }
            }
            .navigationDestination(isPresented: $showGenreView) {
                GenreSelectionView()
            }
        }
    }
}

#Preview {
    ContentView()
}
