//
//  ShowDetailsViewController.swift
//  PolibioFilms
//
//  Created by Artur Rodrigues Fortunato on 09/01/21.
//

import UIKit
import AlamofireImage

class ShowDetailsViewController: UIViewController {

    @IBOutlet weak var labelTItuloShowDetails: UILabel!
    @IBOutlet weak var ImagemFilme: UIImageView!
    @IBOutlet weak var labelDescricaoShowDetais: UILabel!
    @IBOutlet weak var avaliacaoFilme: UILabel!
    @IBOutlet weak var bannerFilme: UIImageView!
    
    
    var tituloFilme: String?
    var resumoFilme: String?
    var avaliacao:String?
    var genero:String?
    var ano:Int?
    var banner:UIImage?
    var puxarBanner:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        labelTItuloShowDetails.text = tituloFilme
        labelDescricaoShowDetais.text = resumoFilme
        bannerFilme.image = banner
        avaliacaoFilme.text = avaliacao
        

    }
    
    //apresenta o viewcontroller na tela
        
    @IBAction func buttonvoltar(_ sender: UIButton) {
        if let navigation = navigationController{
            navigation.popViewController(animated: true)
            
        }
    
    }

}

