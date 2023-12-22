//
//  GenreSelectionViewModel.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/19/23.
//

import Foundation

class GenreSelectionViewModel: ObservableObject {
    @Published var genres: [GenreModel] = []
    
    let headers = [
        "X-RapidAPI-Key": "16f7395f14mshe3f78341e2da921p156d9djsn9fadf13ff506",
        "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
    ]
    
    // getGenres Function
    func getGenres() {
        if let genresURL = Constants.Urls.GenresURL {
            let webservice = Webservice()
            
            webservice.fetchData(from: genresURL, headers: headers) { (result: Result<GenreModel, Error>) in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.genres = [data]
                    }
                    print(data)
                    print("GENRE DATA WORKS")
                case .failure(let error):
                    // Handle error
                    print(error)
                    print("NO GENRE DATA")
                }
            }
        } else {
            print("Invalid genres URL")
        }
    }
}
