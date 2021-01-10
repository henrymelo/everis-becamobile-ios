//
//  FilmeCollectionViewCell.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/8/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FilmeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterFilme: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    
    func configuraCelula () {
        layer.borderWidth = 0.5
        layer.cornerRadius = 8
    }
    
}
