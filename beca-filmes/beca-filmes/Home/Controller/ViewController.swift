//
//  ViewController.swift
//  beca-filmes
//
//  Created by Gabriel Santos Souza on 07/01/21.
//  Copyright © 2021 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.carregaHome()
    }
    
    func carregaHome() {
        FilmesAPI().listaTendencias()
    }

}

