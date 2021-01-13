//
//  FilmeViewModel.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 13/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import Foundation

protocol FilmeViewModelDelegate {
    //func reloadData(movie: MovieViewData)
}

class FilmeViewModel {
    
    // MARK: - Properts
    private let client: FilmeServiceProtocol
    //var viewData: Bindable<MovieViewData?> = Bindable(nil)
    //var delegate: FilmeViewModelDelegate?
    
    // MARK: - Constructors
    init(client: FilmeServiceProtocol = FilmeService()) {
        self.client = client
    }
    
    // MARK: - Methods
    
    func recuperaTendencias(completion:@escaping(_ listaDeTendencias:Array<Tendencia>) -> Void) {
        var tendencias = TendenciaDAO().recuperaTendencia()
        
            client.recuperaTendenciasServidor {
                tendencias = TendenciaDAO().recuperaTendencia()
                completion(tendencias)
            }
    }
    
    func salvaTendencia(tendencia:Dictionary<String, Any>) {
        TendenciaDAO().salvaTendencia(dicionarioDeTendencia: tendencia)
    }
    
    func recuperaDetalhes(_ tendencia:Tendencia, completion:@escaping(_ listaDeDetalhes:Array<Detalhes>) -> Void) {
        var detalhes = DetalhesDAO().recuperaDetalhes()
        
        client.recuperaDetalhesServidor(tendencia) {
            detalhes = DetalhesDAO().recuperaDetalhes()
            completion(detalhes)
        }
    }
    
    func salvaDetalhes(detalhe:Dictionary<String, Any>) {
        DetalhesDAO().salvaDetalhes(dicionarioDeDetalhes: detalhe)
    }
    
    
}
