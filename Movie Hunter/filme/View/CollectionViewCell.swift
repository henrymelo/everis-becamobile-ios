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
    
    
    
    func configuraCelula(_ filme: Filme) {
        
        nomeFilme.text = filme.title
        
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
        
    }
    
}
