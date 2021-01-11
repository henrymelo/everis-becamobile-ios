//
//  DetalhesJSON.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 07/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation

struct results : Decodable {
    
    var vote_average: String?
    var visaoGeral: String?
    var release_date: String?
    var adulto: Bool?
    var backdrop_path: String?
    var genre_ids: String?
    var vote_count: Int?
    var original_language: String?
    var original_title: String?
    var id: Int?
    var video: Bool?
    var popularidade: Double?
    var media_type: String?
}


