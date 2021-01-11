//
//  DetalhesViewController.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 08/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
   
    var filmeSelecionado:Filme? = nil
    
    @IBOutlet weak var nomeDoFilme: UILabel!
    @IBOutlet weak var descricaoFilme: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filme = filmeSelecionado {
            self.nomeDoFilme.text = filme.title
            self.descricaoFilme.text = filme.overview
        }
    }
}
