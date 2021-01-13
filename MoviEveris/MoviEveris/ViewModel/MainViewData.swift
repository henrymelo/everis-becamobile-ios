//
//  MainViewData.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/13/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

protocol MovieViewDataType {
    var filmes: [FilmeSimples] { get }
    //    var title: String { get }
    //    var originalTitle: String { get }
    //    var id: Int { get }
    //    var overview: String { get }
    //    var backdropPath: String { get }
    //    var posterPath: String { get }
    //    var voteAverage: Double { get }

    
}

class MovieViewData {
    
    // MARK: - Properts
    private let model: [FilmeSimples]
    
    // MARK: - Constructors
    init(model: [FilmeSimples]) {
        self.model = model
    }
}

extension MovieViewData: MovieViewDataType {
    
    var filmes: [FilmeSimples] {
        return model
    }
    
   
//    var title: String {
//        guard let titulo = model.title else { return "" }
//        return titulo
//    }
//
//    var originalTitle: String {
//        guard let tituloOriginal = model.originalTitle else { return "" }
//        return tituloOriginal
//    }
//    var id: Int {
//        guard let id = model.id else { return 0 }
//        return id
//    }
//
//    var overview: String {
//        guard let sinopse =  model.overview else { return "" }
//        return sinopse
//    }
//
//    var posterPath: String {
//        guard let poster = model.posterPath else { return "" }
//        return poster
//    }
//    var backdropPath: String {
//        guard let backdropPath = model.backdropPath else { return "" }
//        return backdropPath
//    }
//
//    var voteAverage: Double {
//        guard let rating = model.voteAverage else { return 0.0 }
//        return rating
//    }
    
}
