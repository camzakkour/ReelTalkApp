//
//  TopMoviesViewModel.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/19/23.
//

import Foundation

struct SampleMovie: Equatable {
    var title: String
    var year: Int
    var imgURL: String
}

class TopMoviesViewModel: ObservableObject {
    @Published var movies: [MoviesModel] = []
    
    let headers = [
        "X-RapidAPI-Key": "16f7395f14mshe3f78341e2da921p156d9djsn9fadf13ff506",
        "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
    ]
    
    // getMovies Function
    func getMovies() {
        if let moviesURL = Constants.Urls.MoviesURL {
            let webservice = Webservice()
            
            webservice.fetchData(from: moviesURL, headers: headers) { (result: Result<MoviesModel, Error>) in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.movies = [data]
                    }
                    print(data)
                    print("MOVIES DATA WORKS")
                case .failure(let error):
                    print(error)
                    print("NO MOVIES DATA")
                }
            }
        } else {
            print("Invalid movies URL")
        }
    }
}
