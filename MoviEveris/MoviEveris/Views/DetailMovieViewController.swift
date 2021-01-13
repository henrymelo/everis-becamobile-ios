//
//  DetailMovieViewController.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/12/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var posterFilme: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelTituloOriginal: UILabel!
    
    var filmeSelecionado:FilmeSimples? = nil
    var paginaAtual = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostraFilme()
        // Do any additional setup after loading the view.
    }
    

    func mostraFilme() {
        
        guard let posterPath = filmeSelecionado?.posterPath else { return }
        guard let titulo = filmeSelecionado?.title else { return }
        guard let sinopse = filmeSelecionado?.overview else { return }
        guard let rating = filmeSelecionado?.voteAverage else { return }
        guard let tituloOriginal = filmeSelecionado?.originalTitle else { return }
        
        
        MovieService().getPosterFilme(posterPath) { (poster) in
            self.posterFilme.image = poster
        }
        self.labelTitulo.text = titulo
        self.labelSinopse.text = sinopse
        self.labelRating.text = "Nota: \(rating)"
        self.labelTituloOriginal.text = tituloOriginal
        
        // altera a imagem para ter bordas
        self.posterFilme.layer.cornerRadius = 10
        self.posterFilme.layer.masksToBounds = true
    }
    
    // MARK: - Action
    
    @IBAction func buttonSair(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
