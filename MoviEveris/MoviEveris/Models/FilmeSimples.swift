//
//  FilmeSimples.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/13/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

struct FilmeSimples: Codable {
    let backdropPath: String?
    let id: Int?
    let originalTitle, overview: String?
    let posterPath: String?
    let title: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
        
    }
}
