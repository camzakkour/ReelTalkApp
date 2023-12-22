//
//  SearchBarView.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/20/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        
        // stack for Search bar
            // "Search" placeholder text and the clear button
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(10)
                    .background(Color.white.opacity(0.87))
                    .cornerRadius(20)
                    .foregroundColor(.black)
                
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
                .opacity(searchText.isEmpty ? 0 : 1)
            }
            .frame(width: 350, alignment: .center)
            .padding(.bottom, 10)
        }
    }
}
