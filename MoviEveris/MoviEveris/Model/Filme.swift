//
//  Filme.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/8/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

class Filme: NSObject {

    let id: Int
    let titulo: String
    let sinopse: String
    let rating: Double
    
    init(_ id: Int, _ titulo: String, _ sinopse: String, _ rating: Double) {
        self.id = id
        self.titulo = titulo
        self.sinopse = sinopse
        self.rating = rating
    }
}
