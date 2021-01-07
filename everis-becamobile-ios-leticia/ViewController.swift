//
//  ViewController.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 07/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FilmeAPI().recuperaTendenciasServidor()
        
        FilmeAPI().recuperaDetalhesServidor()
    }
    

}

