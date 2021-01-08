//
//  FilmeAPI.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class FilmeAPI: NSObject {
    
    
    //MARK: - Atributos
    
    let urlBase = "https://api.themoviedb.org"
    let apiKey = "?api_key=96dd278d45abf85bc179831d48f22e83"
    
    //MARK: - GET
    
    func getFilmes(completion:@escaping([[String:Any]]?) -> Void) {
        Alamofire.request("\(urlBase)/3/trending/movie/week\(apiKey)&language=pt-BR&page=1", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String, Any> {
                    guard let listaDeFilme = resposta["results"] as? Array<Dictionary<String, Any>> else { return }
                    completion(listaDeFilme)
                }
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    
    // MARK: - Detalhes
    
    func getDetalhes (completion:@escaping(FilmeDetalhes?) -> Void)  {
        self.getFilmes { (listaDeFilme) in
            guard let listaDeFilmes = listaDeFilme else { return }
            for dicionarioDeFilmes in listaDeFilmes {
                guard let id = dicionarioDeFilmes["id"] as? Int else { return }
                guard let titulo = dicionarioDeFilmes["title"] as? String else { return }
                guard let sinopse = dicionarioDeFilmes["overview"] as? String else { return }
                guard let rating = dicionarioDeFilmes["vote_average"] as? Double else { return }
                let filme = Filme(id, titulo, sinopse, rating)
                Alamofire.request("https://api.themoviedb.org/3/movie/\(filme.id)?api_key=96dd278d45abf85bc179831d48f22e83&language=pt-BR", method: .get).responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success:
                        guard let data = response.data else { return }
                        guard let filmeDetalhes = try? JSONDecoder().decode(FilmeDetalhes.self, from: data) else { return }
                        completion(filmeDetalhes)
                        break
                    case .failure:
                        print(response.error!)
                        break
                    }
                })
                
            }
        }
    }
    
    
    
    
}

