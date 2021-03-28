//
//  AlertaSemInternet.swift
//  provaFilmes
//
//  Created by Aloisio Formento Junior on 11/01/21.
//  Copyright © 2021 Aloisio Formento Junior. All rights reserved.
//

import UIKit

class AlertaSemInternet: NSObject {
    
    func alertaSemInternet(_ controller: UIViewController, _ titulo: String, _ mensagem: String) {
        let alerta = UIAlertController(title: "Atenção", message: "A conexão com a internet parece estar offline", preferredStyle: .alert)
        let botao = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(botao)
        
        controller.present(alerta, animated: true, completion: nil)
    }

}
