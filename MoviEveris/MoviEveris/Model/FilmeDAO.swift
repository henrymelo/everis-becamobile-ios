//
//  FilmeDAO.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/8/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit
import CoreData

class FilmeDAO: NSObject {

    func todosFilmes(dicionarioDeFilmes: Dictionary<String,Any>) {
        guard let id = dicionarioDeFilmes["id"] as? Int else { return }
        guard let titulo = dicionarioDeFilmes["title"] as? String else { return }
        guard let sinopse = dicionarioDeFilmes["overview"] as? String else { return }
        guard let rating = dicionarioDeFilmes["vote_average"] as? Double else { return }
        
        let filme = Filme(id, titulo, sinopse, rating)
        print("\(filme.id)  \(filme.titulo)  \(filme.sinopse)  \(filme.rating)")
    }
    
}
