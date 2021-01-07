//
//  ViewController.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 07/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var toShow:[[String:Any]] = [[:]]
    let filme = Filme()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showMoviesOnTableView()
    }

    func showMoviesOnTableView()  {
        
        FilmesAPI().getTrendingMovies { (dicionario) in
            
            self.filme.trendingComImagem(dicionario)
            self.filme.mostraFilmes()
            
        }
    }
    
}

