//
//  Filmes.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 07/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

struct Filmes: Decodable {
    let count: Int?
    let all: [Filme]
    
    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
    }
}
