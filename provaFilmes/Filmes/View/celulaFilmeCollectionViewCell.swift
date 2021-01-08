//
//  celulaFilmeCollectionViewCell.swift
//  provaFilmes
//
//  Created by Aloisio Formento Junior on 07/01/21.
//  Copyright © 2021 Aloisio Formento Junior. All rights reserved.
//

import UIKit
import AlamofireImage

class celulaFilmeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemFilme: UIImageView!
    
    func setup(_ movie:Filmes) {
        guard let imageUrl = URL(string: "http://image.tmdb.org/t/p/w300\(movie.posterPath)") else { return }
        imagemFilme.af_setImage(withURL: imageUrl)
    }
}
