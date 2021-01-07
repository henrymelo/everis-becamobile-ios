//
//  TestRequisition.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 07/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FilmesAPI: NSObject {
    
    var filmes:[String:Any] = [:]

    func getFilmes(completion:@escaping(_ filmes:[[String:Any]]) -> Void ) {
        
        let myKey = "122c287761eefdfe3d8bcc0154354e73"
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=\(myKey)&language=pt-BR") else { return }
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
                case .success:
                    if let resposta = response.result.value as? [String:Any] {
                        
                        var filmeAtual:[String:Any] = [:]
                        var tituloOuNome = ""
                        var filmesBruto:[[String:Any]] = [[:]]
                        
                        guard let filmes = resposta["results"] as? [[String:Any]] else { return }
                        
                        for filme in filmes {
                            if(filme["title"] != nil) {
                                tituloOuNome = "title"
                                
                            } else {
                                tituloOuNome = "name"
                                
                            }
                            guard let nomeAtual = filme[tituloOuNome] else { return }
                            guard let caminhoAtual = filme["poster_path"] else { return  }
                            filmeAtual = ["nome":nomeAtual, "caminho":caminhoAtual]
                            
                            filmesBruto.append(filmeAtual)
                            
                            
                            
                        }
                        completion(filmesBruto)
                    }
                    break
                case .failure:
                    print(response.error!)
                    break
            }
        }
        
    }
    func getImagens(completion: @escaping(_ filmes: [[String:Any]]) -> Void) {
        
        getFilmes { (filmes) in
            
            var filmesProntos:[[String:Any]] = [[:]]
            
            for filme in filmes {
                
                
                if let filmeCaminho = filme["caminho"] as? String {
                
                    guard let nome = filme["nome"] else { return }
                    guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(filmeCaminho)") else { return }
                    
                    var filmeAtual:[String:Any] = [:]
                    
                    Alamofire.request(url, method: .get).responseImage(completionHandler: { (response) in
                        switch response.result {
                            case .success:
                                
                                if let image = response.result.value {
                                    
                                    filmeAtual = ["nome":nome, "imagem":image]
                                    
                                    filmesProntos.append(filmeAtual)
                                    completion(filmesProntos)
                                }
                                
                                break
                            
                            case .failure:
                                print("Erro na requisição de imagens")
                                break
                        }
                    })
                }
            }
            
            
        }
    }
}
