//
//  TendenciasCollectionViewCell.swift
//  app-filmes
//
//  Created by Gabriel Santos Souza on 19/01/21.
//

import UIKit
import AlamofireImage

class TendenciasCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageFilme: UIImageView!
    @IBOutlet weak var labelTituloFilme: UILabel!
    
    func configuraCelula(_ filme: Filmes) {
        self.labelTituloFilme.text = filme.titulo
        
        guard let urlCapa = FilmesAPI().buscaURLImagem(link: filme.caminhoDaCapa) else { return }
        self.imageFilme.af_setImage(withURL: urlCapa)
    }
    
}
