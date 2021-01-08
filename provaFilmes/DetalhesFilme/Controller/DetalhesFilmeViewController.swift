//
//  DetalhesFilmeViewController.swift
//  provaFilmes
//
//  Created by Aloisio Formento Junior on 08/01/21.
//  Copyright © 2021 Aloisio Formento Junior. All rights reserved.
//

import UIKit
import AlamofireImage

class DetalhesFilmeViewController: UIViewController {

    @IBOutlet weak var tituloFilmeDetalhes: UILabel!
    @IBOutlet weak var imagemFilmeDetalhes: UIImageView!
    @IBOutlet weak var sinopseFilmeDetalhes: UILabel!
    @IBOutlet weak var raitingFilmeDetalhes: UILabel!
    @IBOutlet weak var textoFilmeDetalhes: UITextView!
    
    var filmeSelecionado: Filmes? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let detalhesFilme = filmeSelecionado {
            self.tituloFilmeDetalhes.text = detalhesFilme.title ?? detalhesFilme.name
            self.textoFilmeDetalhes.text = detalhesFilme.overview
            let imageUrl = URL(string: "http://image.tmdb.org/t/p/w780\(detalhesFilme.backdropPath)")
            imagemFilmeDetalhes.af_setImage(withURL: imageUrl!)
            let raiting = detalhesFilme.voteAverage
            let raitingString = String(describing: raiting)
            self.raitingFilmeDetalhes.text = (raitingString + "/10")
        }
    }
    
    @IBAction func buttonVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
