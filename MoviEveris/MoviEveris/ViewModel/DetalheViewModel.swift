//
//  DetalheViewModel.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/13/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate {
    func reloadData(_ id: Int, movie: DetalheMovieViewData)
}

class DetalheViewModel {
    
    // MARK: - Properts
//    var viewModel: DetalheViewModel
    
    // MARK: - Constructors
//    init(detalheViewModel: DetalheViewModel) {
//        self.viewModel = detalheViewModel
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // MARK: - Properts
    private let client: MovieServiceProtocol
    var viewData: Bindable<MovieViewData?> = Bindable(nil)
    var delegate: DetailMovieViewController?
    
    // MARK: - Constructors
    init(client: MovieServiceProtocol = MovieService()) {
        self.client = client
    }
    
    // MARK: - Methods
    func loadMovieDetalhe(_ id: Int) {
        client.getFilmeDetalhe(id) { (movie) in
            //self.viewData.value = MovieViewData(model: movie)
            self.delegate?.reloadData(id, movie: DetalheMovieViewData(model: movie))
            
        } failure: { (error) in
            print(error)
        }
    }
}
