//
//  Filmes.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 08/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Filmes: NSObject {

    //MARK: - Outlets
    
    var vote_average: String
    let visaoGeral: String
    let release_date: String
    let adult: String
    let backdrop_path: String
    let genre_ids: String
    let vote_count: String
    let original_language: String
    let original_title: String
    let id: String
    let video: String
    let popularidade: String
    let media_type: String
    
    init(vote_average: String, visaoGeral: String,release_date: String,adult: String,backdrop_path: String,genre_ids:String,vote_count: String, original_language: String,original_title: String, id: String, video: String, popularidade: String,media_type: String){
        self.vote_average = vote_average
        self.visaoGeral = visaoGeral
        self.release_date = release_date
        self.adult = adult
        self.backdrop_path = backdrop_path
        self.genre_ids = genre_ids
        self.vote_count = vote_count
        self.original_language = original_language
        self.original_title = original_title
        self.id = id
        self.video = video
        self.popularidade = popularidade
        self.media_type = media_type
    }
    
    
    
    
}
