//
//  Filme.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 07/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

// Decodable utilizado para deserialização do JSON
struct Filme: Decodable {
    
    let id: Int
    let posterPath: String
    let title: String
    let voteAverage: Double
    let overview: String
    
    //Passando a String e qual é a CodingKey referente a ela, a CodingKey só será passada caso seja diferente do nome da String
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
        case overview
    }
    
}

