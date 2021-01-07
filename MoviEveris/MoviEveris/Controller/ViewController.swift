//
//  ViewController.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        apresentaFilme()
    }
    
    func apresentaFilme() {
        let empresa = EmpresaProdutora(1, "MA", "MoviesAlt", "Brazil")
        let genero = Genero(1, "Top")
        let paisProdutor = PaisProdutor("BR", "Brazil")
        let linguasFaladas = LinguasFaladas("Portuguese", "pt", "Portugues")
        
        let filme = Filme(adult: false, backdropPath: "urlQualquer", budget: 100000, genres: [genero], homepage: "www.filme.com.br", id: 1, imdbID: "eiu2323ueb", originalLanguage: "Portugues", originalTitle: "Filme", overview: "Um filme", popularity: 50.000, posterPath: "pathQualquer", productionCompany: [empresa], productionCountry: [paisProdutor], releaseDate: "2000-12-25", revenue: 900000, runtime: 200, spokenLanguages: [linguasFaladas], status: "Released", tagline: "Qualquer", title: "Filme", video: false, voteAverage: 10.0, voteCount: 9000)
        
        let filmeCodificado = try? JSONEncoder().encode(filme)
        guard let filmeData = filmeCodificado else { return }
        
        if let json = String(data: filmeData, encoding: .utf8) {
            print(json)
        }
//        let parametros: [String : Any] = [
//            "adult": filme.adult,
//            "backdropPath": filme.backdropPath,
//            "budget": filme.budget,
//            "genres": [filme.genres],
//            "homepage": filme.homepage,
//            "id": filme.id,
//            "imdbID": filme.imdbID,
//            "originalLanguage": filme.originalLanguage,
//            "originalTitle": filme.originalTitle,
//            "overview": filme.overview,
//            "popularity": filme.popularity,
//            "posterPath": filme.posterPath,
//            "productionCompany": [filme.productionCompany],
//            "productionCountry": [filme.productionCountry],
//            "releaseDate": filme.releaseDate,
//            "revenue": filme.revenue,
//            "runtime": filme.runtime,
//            "spokenLanguage": [filme.spokenLanguages],
//            "status": filme.status,
//            "tagline": filme.tagline,
//            "title": filme.title,
//            "video": filme.video,
//            "voteAverage": filme.voteAverage,
//            "voteCount": filme.voteCount
//        ]
//        print(parametros)
        
    }


}

