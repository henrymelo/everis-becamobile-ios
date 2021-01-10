//
//  DetalhesFilmesViewController.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 10/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class DetalhesFilmesViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var imagemDetalhes: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var avaliacaoView: UIView!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    
    //MARK: - Variaveis

    var listaDeFilmes: Result?
   
    //MARK: - life Cycle

    override func viewDidLoad() {
        
        avaliacaoView.layer.borderWidth=1.0
        avaliacaoView.layer.masksToBounds = false
        avaliacaoView.layer.cornerRadius = avaliacaoView.frame.size.height/2
        avaliacaoView.clipsToBounds = true
        
        imagemDetalhes.layer.cornerRadius = 5;
        imagemDetalhes.layer.masksToBounds = true;
      
        configuraFilme()

    }
    
    //MARK: - Métodos

    func configuraFilme(){
        if let filme = listaDeFilmes {
            if filme.mediaType == "movie" {
                if let tituloFilme = filme.originalTitle{
                    self.labelTitulo.text = tituloFilme
                }
            }else{
                if let tituloFilme = filme.originalName{
                    self.labelTitulo.text = tituloFilme
                }
            }
            
            if let descricaoFilme = filme.overview{
                self.labelDescricao.text = descricaoFilme
            }
            
            let caminhoDaImagem: String
            caminhoDaImagem = filme.backdropPath ?? ""
            
            let imageUrl = URL(string: "https://image.tmdb.org/t/p/original\(caminhoDaImagem)")
            
            if let url = imageUrl {
                imagemDetalhes.af_setImage(withURL: url)
            }
            
            var ratingFilme = filme.voteAverage
            ratingFilme = ratingFilme * 10
            let avaliacao = String(format: "%.0f%%" ,ratingFilme)
            self.labelRating.text = avaliacao
            
            
            if ratingFilme >= 85 {
                self.labelEstrela.text = "⭐⭐⭐⭐⭐"
            }
            else if ratingFilme >= 65 && ratingFilme < 85{
                self.labelEstrela.text = "⭐⭐⭐⭐"
            }
            else if ratingFilme >= 50 && ratingFilme < 65{
                self.labelEstrela.text = "⭐⭐⭐"
            }
            else if ratingFilme >= 35 && ratingFilme < 50{
                self.labelEstrela.text = "⭐⭐"
            }
            else {
                self.labelEstrela.text = "⭐"
            }
        }

    }

}
