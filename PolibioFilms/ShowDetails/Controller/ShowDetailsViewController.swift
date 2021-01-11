//
//  ShowDetailsViewController.swift
//  PolibioFilms
//
//  Created by Artur Rodrigues Fortunato on 09/01/21.
//

import UIKit

class ShowDetailsViewController: UIViewController {

    @IBOutlet weak var labelTItuloShowDetails: UILabel!
    @IBOutlet weak var ImagemFilme: UIImageView!
    @IBOutlet weak var labelDescricaoShowDetais: UILabel!
    @IBOutlet weak var avaliacaoFilme: UILabel!

    
    var tituloFilme: String?
    var resumoFilme: String?
    var avaliacao:Double?
    var genero:String?
    var ano:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        labelTItuloShowDetails.text = tituloFilme
        labelDescricaoShowDetais.text = resumoFilme
       
        
        
    }
    @IBAction func buttonvoltar(_ sender: UIButton) {
        if let navigation = navigationController{
            navigation.popViewController(animated: true)
            
        }
    
    }

}

