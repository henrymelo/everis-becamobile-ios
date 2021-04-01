//
//  MainViewData.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/13/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

protocol MovieViewDataType {
    var filmes: [FilmeSimples] { get }
   

    
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
    
}
