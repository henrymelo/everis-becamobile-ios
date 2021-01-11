//
//  FilmesAPI.swift
//  Filmes
//
//  Created by Letycia Sobrinho Marques on 08/01/21.
//

import UIKit
import Alamofire
import AlamofireImage
import CoreData

class FilmesAPI: NSObject {
    
    var listaFilmes:[String: Any] = [:]
    var minhaChave:String = "fda3fa048b5dd1721be8d5512626b16a"
    
    init(_ chave: String) {
        self.minhaChave = chave
    }

    //MARK: importar Filmes
    func importarFilmes(terminou:@escaping(_ listaFilmes: [[String:Any]]) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=\(minhaChave)&language=pt-BR", method: .get).responseJSON { (response) in
                switch response.result {
                case .success:
                    if let resultado = response.result.value as? [String:Any] {
                        
                        
                        guard let lista = resultado["results"] as? [[String:Any]]
                else {return}
                        
                    terminou(lista)

                    }
                    break

                case .failure:
              print(response.error!)
                break
                }
            }
    }
    
    //MARK: baixarImagens
    func baixarImagens(terminou: @escaping(_ listaFilmes: [[String:Any]]) -> Void) {
        self.importarFilmes() { (retornoDosFilmes) in
            
            var filmes:[[String:Any]] = [[:]]
            
            
            for filme in retornoDosFilmes {
                
                if(filme["title"] != nil) {
                    
                    guard let titulo  = filme["title"] else {
                        print("falha ao pegar titulo")
                        return
                    }
                    guard let id      = filme["id"] else {
                        print("falha ao pegar a id")
                        return
                    }
                    guard let caminho = filme["poster_path"] else {
                        print("falha ao pegar a caminho")
                        return
                    }
                    guard let urlCapa = URL(string: "https://image.tmdb.org/t/p/w500\(caminho)") else {
                        print("falha ao pegar a capa")
                        return
                    }
                    
                    var filmeComImagem:[String:Any] = [:]
                    Alamofire.request(urlCapa, method: .get).responseImage(completionHandler: {
                        (response) in
                        switch response.result {
                            case .success:
                                guard let capa = response.result.value else {
                                    print("falha ao pegar a capa")
                                    return
                                }
                                
                                filmeComImagem = [
                                    "titulo":titulo,
                                    "imagem": capa,
                                    "id": id
                                ]
                                filmes.append(filmeComImagem)
                                terminou(filmes)
                            break
                        case .failure:
                            print("Erro: Nao foi possivel encontrar imagem")
                            break
                        }
                    })
                }
            }
            
            //print(filmes)
            //terminou(filmes)
            
        }
    }
    
}
