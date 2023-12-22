//
//  MoviesModel.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/18/23.
//

import Foundation

struct MoviesModel: Codable {
    let results: [TopMoviesModel]
}

struct TopMoviesModel: Codable {
    let originalTitleText: TitleText
    let releaseYear: ReleaseYear
    let primaryImage: PrimaryImage
}

struct TitleText: Codable {
    let text: String
}

struct PrimaryImage: Codable {
    let url: String
}

struct ReleaseYear: Codable {
    let year: Int
    let endYear: Int?
}
