//
//  DetalhesViewController.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 08/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import CoreData

class DetalhesViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var capaImagem: UIImageView!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var detalhesSelecionado:Array<Detalhes> = []
    var tendencia:Tendencia?
    var detalhes:Array<Detalhes> = []
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tendenciaSelecionada = tendencia else { return }
        Repositorio().recuperaDetalhes(tendenciaSelecionada) { (listaDeDetalhes) in
            self.detalhes = listaDeDetalhes
            self.setup(listaDeDetalhes)
        }
    }
    

    // MARK: - Métodos
    
    func setup(_ dicionarioDeDetalhes:Array<Detalhes>) {
        print("TEEESTE")
//
//
//        descricaoLabel.text = detalhesSelecionado?.overview
//        tituloLabel.text = detalhesSelecionado?.title
//        print(detalhesSelecionado?.overview)
//        print(detalhesSelecionado?.title)
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
