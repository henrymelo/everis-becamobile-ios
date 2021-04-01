//
//  MainViewModel.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/13/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate {
    func reloadData(movie: MovieViewData)
}

class MainViewModel {
    
    // MARK: - Properts
    private let client: MovieServiceProtocol
    var viewData: Bindable<MovieViewData?> = Bindable(nil)
    var delegate: MainViewModelDelegate?
    var paginaAtual = 1
    private var filmeSelecionado: [FilmeSimples]? = nil
    
    // MARK: - Constructors
    init(client: MovieServiceProtocol = MovieService()) {
        self.client = client
    }
    
    // MARK: - Methods
    func loadMovie() {
        client.getFilmesPopulares(paginaAtual) { (movie) in
            //self.viewData.value = MovieViewData(model: movie)
            self.delegate?.reloadData(movie: MovieViewData(model: self.filmeSelecionado!))
        } failure: { (error) in
            print(error)
        }
    }
}
