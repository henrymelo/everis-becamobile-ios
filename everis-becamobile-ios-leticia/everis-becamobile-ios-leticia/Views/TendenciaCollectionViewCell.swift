//
//  TendenciaCollectionViewCell.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 08/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import AlamofireImage

class TendenciaCollectionViewCell: UICollectionViewCell {
    
     @IBOutlet weak var capaFilme: UIImageView!
    
    func configuraCelula(_ tendencia:Tendencia) {
        
        let url = tendencia.poster_path!
        guard let imageUrl = URL(string: "http://image.tmdb.org/t/p/w185\(url)") else { return }
        capaFilme.af_setImage(withURL: imageUrl)
        
        //Arredondar as bordas da imagem
        capaFilme.layer.cornerRadius = 10
        capaFilme.layer.masksToBounds = true
        
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
        
    }
    
}
