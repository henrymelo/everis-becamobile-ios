//
//  CollectionViewCell.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 10/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filmeNome: UILabel!
    
    func configuraCelula(filme: Filme) {
        filmeNome.text = filme.title
        
    }
    
}
