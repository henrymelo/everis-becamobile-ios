//
//  Filme.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 07/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation

class Filme{
    
    //MARK: - Atributos
    
    let vote_average: String
    let titulo: String
    let visaoGeral: String
    let release_date: String
    let adulto: Bool
    let backdrop_path: String
    let genre_ids: Array<Int>
    
    init(vote_average: String, titulo: String, visaoGeral: String, release_date: String, adulto: Bool, backdrop_path: String, genre_ids: Array<Int>){
        self.vote_average = vote_average
        self.titulo = titulo
        self.visaoGeral = visaoGeral
        self.release_date = release_date
        self.adulto = adulto
        self.backdrop_path = backdrop_path
        self.genre_ids = genre_ids
    }
    
}
