//
//  DetalhesFilmeViewController.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit
import Alamofire

class DetalhesFilmeViewController: UIViewController {

    
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelTagline: UILabel!
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var labelBudget: UILabel!
    
    @IBOutlet weak var labelRevenue: UILabel!
    
    @IBOutlet weak var labelGenero: UILabel!
    
    @IBOutlet weak var labelSinopse: UILabel!
    
    @IBOutlet weak var imagePoster: UIImageView!
    
    
    var filmeSelecionado:Filme? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filme = filmeSelecionado {
            
            labelTitulo.text = filme.titulo
            labelTagline.text = filme.tagline
            labelData.text = filme.data
            
            if filme.budget == 0 {
                 labelBudget.text = "Desconhecido"
            }else{
            labelBudget.text = "US$ \(filme.budget)"
            }
            
            if filme.revenue == 0 {
                labelRevenue.text = "Desconhecido"
            }else{
                labelRevenue.text = "US$ \(filme.revenue)"
            }
            
            labelSinopse.text = filme.sinopse
            
            if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(filme.caminhoImagem)"){
                    imagePoster.af_setImage(withURL: imageUrl)
            }
            
        }

    }
    

}
