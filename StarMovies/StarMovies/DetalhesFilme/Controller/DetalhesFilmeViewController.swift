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
    
    //MARK: - Outlets

    @IBOutlet weak var imageBackground: UIImageView!
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelTagline: UILabel!
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var labelBudget: UILabel!
    
    @IBOutlet weak var labelRevenue: UILabel!
    
    @IBOutlet weak var labelGenero: UILabel!
    
    @IBOutlet weak var labelSinopse: UILabel!
    
    @IBOutlet weak var imagePoster: UIImageView!
    
    @IBOutlet weak var labelNota: UILabel!
    
    //MARK: - Variaveis
    
    var filmeSelecionado:Filme? = nil
    
    //MARK: - Funcoes
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filme = filmeSelecionado {
            
            labelTitulo.text = filme.titulo
            labelNota.text = "\(filme.nota)"
            labelTagline.text = filme.tagline
            labelData.text = filme.data
            labelBudget.text = filme.getBudgetFormatado()
            labelRevenue.text = filme.getRevenueFormatado()
            labelGenero.text = filme.generos
            labelSinopse.text = filme.sinopse
            
            if let imageUrl = FilmeAPI().gerarURLImagem(link: filme.caminhoImagemPoster){
                    imagePoster.af_setImage(withURL: imageUrl)
                
                imagePoster.layer.shadowColor = UIColor.black.cgColor
                imagePoster.layer.shadowOpacity = 1
                imagePoster.layer.shadowOffset = .zero
                imagePoster.layer.shadowRadius = 5
            }
            
            if let imageUrl = FilmeAPI().gerarURLImagem(link: filme.caminhoImagemBg) {
                imageBackground.af_setImage(withURL: imageUrl)
            }
            
        }

        labelSinopse.adjustsFontSizeToFitWidth = true
        labelBudget.adjustsFontSizeToFitWidth = true
        labelRevenue.adjustsFontSizeToFitWidth = true
        
    }
    
    @IBAction func buttonFecharDetalhes(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
