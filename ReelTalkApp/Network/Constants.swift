//
//  Constants.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/18/23.
//

import Foundation

struct Constants {
    
    struct Urls {
        static let GenresURL = URL(string: "https://moviesdatabase.p.rapidapi.com/titles/utils/genres")
        
        static let MoviesURL = URL(string: "https://moviesdatabase.p.rapidapi.com/titles?list=top_boxoffice_200&limit=30")
        
        static let ShowsURL = URL(string: "https://moviesdatabase.p.rapidapi.com/titles?list=top_rated_series_250&limit=30")
    }
}
