//
//  FilmeResultTableViewCell.swift
//  cinesofa
//
//  Created by Fabricio Rodrigo Baixo on 1/10/21.
//  Copyright © 2021 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class FilmeResultTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUrl: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
