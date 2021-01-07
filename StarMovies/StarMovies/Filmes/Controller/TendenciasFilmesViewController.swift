//
//  TendenciasFilmesViewController.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit

class TendenciasFilmesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FilmeAPI().pegarListaTendenciasFilmes { (resposta) in
            print(resposta.count)
        }
        
        FilmeAPI().pegarDetalhesFilme(codFilme: "464052") { (resposta) in
            print(resposta["title"])
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
