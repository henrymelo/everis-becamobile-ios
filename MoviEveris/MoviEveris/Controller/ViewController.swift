//
//  ViewController.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        apresentaFilme()
    }
    
    func apresentaFilme() {
        FilmeAPI().getFilmesPopulares()
    }


}

