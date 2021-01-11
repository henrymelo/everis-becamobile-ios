//
//  DescricaoFilmeViewController.swift
//  cinesofa
//
//  Created by Fabricio Rodrigo Baixo on 1/11/21.
//  Copyright © 2021 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class DescricaoFilmeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let filme = filmeSelecionado else {return print("Erro ao buscar informações sobre o pacoteViagens(classe: DetalhesViagensViewController)")}
        print(filme.overview)
    }
    
    var filmeSelecionado:Result?

    


    @IBAction func botaoVoltar(_ sender: UIButton) {
        if let voltar = self.navigationController{
            voltar.popToRootViewController(animated: true)}
    }
    
}
