//
//  File.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

class Movie: Codable {
    
    // MARK: - Atributos
    
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: JSONNull?
    let budget: Int
    let genres: [Genero]
    let homepage: String
    let id: Int
    let imdbID: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompany: [EmpresaProdutora]
    let productionCountry: [PaisProdutor]
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [LinguasFaladas]
    let status: String
    let tagline :String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    // MARK: - Init
    
    init(_ adult: Bool, _ backdropPath: String, belongsToCollection: JSONNull?, _ budget: Int, _ genres: [Genero], _ homepage: String, _ id: Int, _ imdbID: String, _ originalLanguage: String, _ originalTitle: String, _ overview: String, _ popularity: Double, _ posterPath: String, productionCompany: [EmpresaProdutora], productionCountry:[PaisProdutor], _ releaseDate: String, _ revenue: Int, _ runtime: Int, _ spokenLanguages: [LinguasFaladas], _ status: String, _ tagline: String, _ title: String, _ video: Bool, _ voteAverage: Double, _ voteCount: Int) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.belongsToCollection = belongsToCollection
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.id = id
        self.imdbID = imdbID
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.productionCompany = productionCompany
        self.productionCountry = productionCountry
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.spokenLanguages = spokenLanguages
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    
}
