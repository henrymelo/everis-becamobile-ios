//
//  ViewController.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 07/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let filmesAPI = FilmesRequisition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recuperaImages()
        recuperaDetalhes()
    }
    
    func recuperaImages() {
        
        filmesAPI.getImagens { (filmes) in
           // print(filmes)
        }
    }
    func recuperaDetalhes() {
        filmesAPI.pegarDetalhesPelo(id: 508442) { (filme) in
            print(filme)
        }
    }
}

