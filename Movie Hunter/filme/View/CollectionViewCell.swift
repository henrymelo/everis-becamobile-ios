//
//  CollectionViewCell.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 10/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imagemFilme: UIImageView!
    @IBOutlet weak var nomeFilme: UILabel!
    
    func configuraCelula(filme: Filme) {
         //guard let posterMenor = Configuracao().getPosterMenor() else { return }
        
        nomeFilme.text = filme.title
        
    }
    
}
