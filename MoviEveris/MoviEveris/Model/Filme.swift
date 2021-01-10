//
//  Filme.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/9/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

class Filme: NSObject {
    
    let id: Int
    let titulo: String
    let sinopse: String
    let rating: Double
    let poster: String
    
    init(_ id: Int, _ titulo: String, _ sinopse: String, _ rating: Double, _ poster: String) {
        self.id = id
        self.titulo = titulo
        self.sinopse = sinopse
        self.rating = rating
        self.poster = poster
    }
}
