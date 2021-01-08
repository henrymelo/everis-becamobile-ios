//
//  DetalhesFilmeViewController.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 08/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit

class DetalhesFilmeViewController: UIViewController {
    
    // MARK: - Outlets
    
    let filmesAPI = FilmesRequisition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recuperaDetalhes()
    }
    
    
    func recuperaDetalhes() {
        filmesAPI.pegarDetalhesPelo(id: 508442) { (filme) in
            //
        }
    }

}
