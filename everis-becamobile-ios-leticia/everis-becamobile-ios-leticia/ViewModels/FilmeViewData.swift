//
//  FilmeViewData.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 13/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

protocol FilmeViewDataType {
    var id: Int { get }
    var mediaType: String { get }
    var overview: String { get }
    var posterPath: String { get }
    var title: String { get }
    var voteAverage: Double { get }
    
}

class FilmeViewData {
    
    // MARK: - Properts
    private let model: Filme
    
    // MARK: - Constructors
    init(model: Filme) {
        self.model = model
    }
}

extension FilmeViewData: FilmeViewDataType {
    var id: Int {
        return model.id
    }
    
    var mediaType: String {
        return model.mediaType
    }
    
    var overview: String {
        return model.overview
    }
    
    var posterPath: String {
        return model.posterPath
    }
    
    var title: String {
        return model.title
    }
    
    var voteAverage: Double {
        return model.voteAverage
    }
    
    
}
