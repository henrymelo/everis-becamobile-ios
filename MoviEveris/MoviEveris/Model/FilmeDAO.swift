//
//  FilmeDAO.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/11/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import CoreData

class FilmeDAO: NSObject {
    
    // MARK: - Atributos
    
    var filmeAtual:[String:Any] = [:]
    
    
    // MARK: - Métodos
    
    func filmeDetalhes(_ paginaToBe: Int, _ id:Int, completion: @escaping(_ filme:[[String:Any]]) -> Void)  {
        // Pega os detalhes de cada filme pelo Id
        FilmeAPI().getFilmesPopulares(paginaToBe) { (filmes) in
//            print("Pagina Atual detalhes: ", paginaToBe)
            
            let filmeAtual = filmes.filter({ filmeAtual in
                guard let filme = filmeAtual["id"] as? Int else { return false }
                return filme == id
            })
            completion(filmeAtual)
        }
    }
    
    func montaListaFilmes (_ filmeData:[[String:Any]]) -> [[String:Any]] {
        var filmesLista:[[String:Any]] = [[:]]
        for filme in filmeData {
            guard let id = filme["id"] else { return [[:]] }
            guard let tituloOriginal = filme["original_title"] else { return [[:]] }
            guard let titulo = filme["title"] else { return [[:]] }
            guard let posterPath = filme["poster_path"] else { return [[:]] }
            guard let sinopse = filme["overview"] else { return [[:]] }
            guard let rating = filme["vote_average"] else { return [[:]] }
            self.filmeAtual = [
                "id":id,
                "tituloOriginal": tituloOriginal,
                "titulo":titulo,
                "poster":posterPath,
                "sinopse":sinopse,
                "rating": rating
            ]
            filmesLista.append(self.filmeAtual)
        }
        return filmesLista
    }
    
    
}
