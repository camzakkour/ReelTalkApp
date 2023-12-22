//
//  TopShowsViewModel.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/19/23.
//

import Foundation

struct Show: Equatable {
    var title: String
    var year: Int
    var endYear: Int
    var imgURL: String
}

class TopShowsViewModel: ObservableObject {
    @Published var shows: [ShowsModel] = []
    let headers = [
        "X-RapidAPI-Key": "16f7395f14mshe3f78341e2da921p156d9djsn9fadf13ff506",
        "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
    ]
    
    // getShows Function
    func getShows() {
        if let showsURL = Constants.Urls.ShowsURL {
            let webservice = Webservice()
            
            webservice.fetchData(from: showsURL, headers: headers) { (result: Result<ShowsModel, Error>) in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.shows = [data]
                    }
                    print(data)
                    print("SHOWS DATA WORKS")
                case .failure(let error):
                    print(error)
                    print("NO SHOWS DATA")
                }
            }
        } else {
            print("Invalid shows URL")
        }
    }
}
