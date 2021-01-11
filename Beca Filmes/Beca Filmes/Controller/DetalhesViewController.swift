//
//  DetalhesViewController.swift
//  Beca Filmes
//
//  Created by Lucas Abdel Leitao on 08/01/21.
//  Copyright © 2021 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    let listaDetalhes: Array<String>? = []
    
    @IBOutlet weak var imagemDetalhes: UIImageView!
    @IBOutlet weak var tituloDetalhes: UILabel!
    @IBOutlet weak var descricaoDetalhes: UILabel!
    
    
    var titulo: String?
    var descricao: String?
    var imagemPassada: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tituloDetalhes.text = titulo
        descricaoDetalhes.text = descricao
        imagemDetalhes.image = imagemPassada
    }

}
