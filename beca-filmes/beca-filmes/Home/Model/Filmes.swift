//
//  Filmes.swift
//  beca-filmes
//
//  Created by Gabriel Santos Souza on 08/01/21.
//  Copyright © 2021 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class Filmes: NSObject {
    
    var titulo: String = ""
    var caminhoDaCapa: String = ""
    
    init(dicionarioDeFilme: Dictionary<String, Any>) {
        guard let tipo = dicionarioDeFilme["media_type"] as? String else { return }
        if tipo == "movie" {
            guard let titulo = dicionarioDeFilme["title"] as? String else { return }
            self.titulo = titulo
        } else {
            guard let titulo = dicionarioDeFilme["name"] as? String else { return }
            self.titulo = titulo
        }
        
        guard let caminhoDaCapa = dicionarioDeFilme["poster_path"] as? String else { return }
        self.caminhoDaCapa = caminhoDaCapa
    }

}
