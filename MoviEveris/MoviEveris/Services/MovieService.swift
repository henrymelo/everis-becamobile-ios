//
//  MovieService.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/12/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import CoreData

protocol MovieServiceProtocol {
    func GetFilmesPopulares (_ paginaToBe: Int, completionHandler: @escaping (_ filme: Filme) -> Void, failure: (_ error: String) -> Void)
}

class MovieService: NSObject {
    
    // MARK: - Atributos
    
    var filmes:[String:Any] = [:]
    var filmeAtual:[String:Any] = [:]
    var paginaAtual: Int = 1
    let apiKey = "96dd278d45abf85bc179831d48f22e83"
    let movieUrl = "https://api.themoviedb.org/"
    let imageUrl = "https://image.tmdb.org"
    
    // MARK: - Métodos
    
    func getFilmesPopulares(_ paginaToBe: Int, completion:@escaping([Filme]) -> Void ) {
        // Método para pegar os filmes popularesda semana
//        print(paginaAtual)
        Alamofire.request("\(movieUrl)3/trending/movie/week?api_key=\(apiKey)&language=pt-BR&page=\(paginaToBe)", method: .get).responseJSON { ( response ) in

//            var filmesLista:[[String:Any]] = [[:]]
            switch response.result {
            case .success:
                guard let dataFilme = response.data else { return }
                do{
                    let filmes = try JSONDecoder().decode(ListaFilmes.self, from: dataFilme)
                    let listaFilmes = filmes.results
//                    print(listaFilmes)
                    completion(listaFilmes)
                } catch {
                    print(error.localizedDescription)
                }
                
//                if let resposta = response.result.value as? [String:Any] {
//                    guard let filmeData = resposta["results"] as? [[String:Any]] else { return }
//                    print(filmeData)
//                    // Monta a lista de filmes que será usada no restante do projeto
//                    filmesLista = FilmeDAO().montaListaFilmes(filmeData)
//                    completion(filmesLista)
//                }
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    
    func getPosterFilme(_ posterPath: String, completion: @escaping(_ posterFilme: Image) ->Void) {
        // Método para pegar o poster de cada filme
        Alamofire.request("\(self.imageUrl)/t/p/w500\(posterPath)", method: .get).responseImage(completionHandler: { (response) in
            switch response.result {
            case .success:
                guard let posterFilme = response.result.value else { return}
                completion(posterFilme)
                break
            case .failure:
                print(response.error!, "Erro ao buscar imagem")
                break
            }
        })
    }
    
}



