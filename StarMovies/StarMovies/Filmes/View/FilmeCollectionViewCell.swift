//
//  FilmeCollectionViewCell.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit

class FilmeCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageFilme: UIImageView!
    
    @IBOutlet weak var labelTituloFilme: UILabel!
    
    //Mark: - Funcoes de configuracao
    
    func configurarCelula(_ filme:Filme){
        
        self.labelTituloFilme.text = filme.titulo
        
        if let urlImagem = FilmeAPI().gerarURLImagem(link: filme.caminhoImagemPoster) {
            self.imageFilme.af_setImage(withURL: urlImagem)
        }
        
    }
    
    func aplicarSombrar(){
        self.imageFilme.layer.shadowColor = UIColor.black.cgColor
        self.imageFilme.layer.shadowOpacity = 1
        self.imageFilme.layer.shadowOffset = .zero
        self.imageFilme.layer.shadowRadius = 5
    }
    
} 
