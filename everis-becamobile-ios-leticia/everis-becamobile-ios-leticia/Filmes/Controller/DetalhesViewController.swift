//
//  DetalhesViewController.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 08/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var capaImagem: UIImageView!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Métodos
    
    func setup(_ tendencia:Tendencia) {
        descricaoLabel.text = tendencia.overview
        
    }
    
//    func montaDicionarioDeParametros() -> Dictionary<String, String> {
//        var id = ""
//
//        if tendencia?.id == nil {
//            print("id nulo")
//        } else {
//            guard let idTendencia = tendencia?.id else { return [:] }
//            id = String(describing: idTendencia)
//        }
//
//        guard let titulo = tituloLabel.text else { return [:] }
//        guard let descricao = descricaoLabel.text else { return [:] }
//
//        let dicionario:Dictionary<String, String> = [
//            "id": id,
//            "titulo" : titulo,
//            "descricao": descricao
//        ]
//
//        return dicionario
//    }

    
}
