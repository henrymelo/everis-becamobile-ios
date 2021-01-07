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
    
    var filmeSelecionado:Filme? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        if let filme = filmeSelecionado {
            
            labelTitulo.text = filme.titulo
            labelNota.text = "\(filme.nota)"
            labelTagline.text = filme.tagline
            labelData.text = filme.data
            
            //NECESSITA DE REFATORACAO
            
            if filme.budget == 0 {
                 labelBudget.text = "Desconhecido"
            }else{
                let budgetFormatado = NSNumber(integerLiteral: filme.budget)
                
                if let budgetFormatado = currencyFormatter.string(from: budgetFormatado) {
                    labelBudget.text = "\(budgetFormatado)"
                }
            }
            
            if filme.revenue == 0 {
                labelRevenue.text = "Desconhecido"
            }else{
                let revenueFormatado = NSNumber(integerLiteral: filme.revenue)
                
                if let revenueFormatado = currencyFormatter.string(from: revenueFormatado) {
                    labelRevenue.text = "\(revenueFormatado)"
                }
            }
            
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

    }
    
    @IBAction func buttonFecharDetalhes(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
