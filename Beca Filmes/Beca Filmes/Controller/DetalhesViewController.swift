//
//  DetalhesViewController.swift
//  Beca Filmes
//
//  Created by Lucas Abdel Leitao on 08/01/21.
//  Copyright © 2021 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    
    @IBOutlet weak var imagemDetalhes: UIImageView!
    @IBOutlet weak var tituloDetalhes: UILabel!
    @IBOutlet weak var descricaoDetalhes: UILabel!
    
    

    var filme: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = filme?.posterPath{
            imagemDetalhes.loadImage(imgpath: path)
        }
        
        if filme?.title == nil{
            guard let titulo = filme?.name else{return}
            tituloDetalhes.text = titulo
        }else{
            guard let titulo = filme?.title else{return}
            tituloDetalhes.text = titulo
        }
        
        descricaoDetalhes.text = filme?.overview
        
    }
}
