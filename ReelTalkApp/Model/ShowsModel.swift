//
//  ShowsModel.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/18/23.
//

import Foundation

struct ShowsModel: Codable {
    let results: [TopShowsModel]
}

struct TopShowsModel: Codable {
    let originalTitleText: TitleText
    let releaseYear: ReleaseYear
    let primaryImage: PrimaryImage
}
