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
    var filmeToShow:[[String:Any]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recuperaDetalhes()
    }
    

    func recuperaDetalhes() {
        filmesAPI.pegarDetalhesPelo(id: 508442) { (filme) in
            self.filmeToShow = filme
            self.mostra()
        }
    }
    func mostra() {
        print(filmeToShow)
    }
}

