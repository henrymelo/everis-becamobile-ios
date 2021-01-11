//
//  Result.swift
//  cinesofa
//
//  Created by Fabricio Rodrigo Baixo on 1/7/21.
//  Copyright © 2021 Fabricio Rodrigo Baixo. All rights reserved.
//

import Foundation


struct Result : Codable {
    
    var id: Int = 0
    var backdropPath: String = ""
    var title: String?
    var overview = ""
    var posterPath: String = ""
    
    enum CodingKeys: String,CodingKey{
        case id
        case backdropPath = "backdrop_path"
        case title
        case overview
        case posterPath = "poster_path"
    }

}


struct ResultDataStore: Codable {
    var results: [Result]
}
