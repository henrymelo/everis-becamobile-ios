//
//  DetalhesDoFilmeViewController.swift
//  Filmes
//
//  Created by Letycia Sobrinho Marques on 09/01/21.
//

import UIKit

class DetalhesDoFilmeViewController: UIViewController {
    
    // MARK: IBOutlets - detalhes filmes
    
    @IBOutlet weak var tituloFilme: UILabel!
        
    @IBOutlet weak var imagemDoFilme: UIImageView!
    
    @IBOutlet weak var textoSinopse: UILabel!
    
    @IBOutlet weak var textoLancamento: UILabel!
    
    
    // MARK: IBAction
    
    
    @IBAction func voltar(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
       
    var meusFilmes:[String:Any]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
