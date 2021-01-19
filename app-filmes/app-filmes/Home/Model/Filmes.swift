//
//  Filmes.swift
//  app-filmes
//
//  Created by Gabriel Santos Souza on 19/01/21.
//

import UIKit

class Filmes: NSObject {
    
    var titulo: String = ""
    var caminhoDaCapa: String = ""
    var sinopse: String = ""
    var nota: String = ""
    
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
        
        guard let sinopse = dicionarioDeFilme["overview"] as? String else { return }
        self.sinopse = sinopse
        
        guard let nota = dicionarioDeFilme["vote_average"] as? Double else { return }
        self.nota = String(nota)
    }

}
