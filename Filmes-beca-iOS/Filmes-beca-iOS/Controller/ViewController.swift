//
//  ViewController.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 07/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let filmesAPI = FilmesAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recuperaImages()
    }
    
    func recuperaImages() {
        
        filmesAPI.getImagens { (filmes) in
            print(filmes)
        }
        
    }
}

