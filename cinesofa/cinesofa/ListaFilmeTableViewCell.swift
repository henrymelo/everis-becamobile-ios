//
//  ListaFilmeTableViewCell.swift
//  cinesofa
//
//  Created by Fabricio Rodrigo Baixo on 1/11/21.
//  Copyright © 2021 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class ListaFilmeTableViewCell: UITableViewCell {

    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var imagemFundo: UILabel!
    @IBOutlet weak var imagemPoster: UILabel!
    @IBOutlet weak var titulo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
