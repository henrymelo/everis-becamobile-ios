//
//  TendenciaTableViewCell.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 08/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import AlamofireImage

class TendenciaTableViewCell: UITableViewCell {
    

    @IBOutlet weak var capaFilme: UIImageView!
    
    func configuraCelula(_ tendencia:Tendencia) {
        //labelTitulo.text = tendencia.overview
        
        let url = tendencia.poster_path!
        guard let imageUrl = URL(string: "http://image.tmdb.org/t/p/w185\(url)") else { return }
        capaFilme.af_setImage(withURL: imageUrl)
        
        //Arredondar as bordas da imagem
        capaFilme.layer.cornerRadius = 10
        capaFilme.layer.masksToBounds = true
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
