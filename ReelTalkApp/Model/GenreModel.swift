//
//  GenreModel.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/18/23.
//

import Foundation

struct GenreModel: Codable {
    let results: [String?]
    
    var filteredResults: [String] {
        return results.compactMap { $0 }
    }

}
