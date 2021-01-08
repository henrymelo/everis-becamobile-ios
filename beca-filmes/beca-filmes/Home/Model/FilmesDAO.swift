//
//  FilmesDAO.swift
//  beca-filmes
//
//  Created by Gabriel Santos Souza on 08/01/21.
//  Copyright © 2021 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class FilmesDAO: NSObject {
    
    func salvaFilmes(dicionarioDeFilmes: Dictionary<String, Any>) {
        guard let capa = dicionarioDeFilmes["poster_path"] as? String else {
            print("Deu errado na imagem")
            return
        }
        print(capa)
        
        guard let tipo = dicionarioDeFilmes["media_type"] as? String else {
            print("Deu errado :(")
            return
        }
        if tipo == "movie" {
            guard let titulo = dicionarioDeFilmes["title"] as? String else {
                print("Deu errado no titulo :(")
                return
            }
            print(titulo)
        } else {
            guard let nome = dicionarioDeFilmes["name"] as? String else {
                print("Deu errado no título :(")
                return
            }
            print(nome)
        }
        
        guard let sinopse = dicionarioDeFilmes["overview"] as? String else {
            print("Deu errado na sinopse")
            return
        }
        print(sinopse)
        
        guard let nota = dicionarioDeFilmes["vote_average"] as? Double else {
            print("Deu errado na nota")
            return
        }
        print(nota)
        
        guard let votos = dicionarioDeFilmes["vote_count"] as? Double else {
            print("Deu errado nos votos")
            return
        }
        print(votos)
    }

}
