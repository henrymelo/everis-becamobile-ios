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
import CoreData

class FilmesRequisition: NSObject {
    
    var filmes:[String:Any] = [:]

    func getFilmes(_ pagina:Int=1, completion:@escaping(_ filmes:[[String:Any]]) -> Void ) {
        
        let myKey = "122c287761eefdfe3d8bcc0154354e73"
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=\(myKey)&language=pt-BR&page=\(pagina)") else { return }
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
                case .success:
                    if let resposta = response.result.value as? [String:Any] {
                        
                        var filmeAtual:[String:Any] = [:]
                        var tituloOuNome = ""
                        var lancaOuEstreia = ""
                        var filmesBruto:[[String:Any]] = [[:]]
                        
                        guard let filmes = resposta["results"] as? [[String:Any]] else { return }
                        
                        for filme in filmes {
                            if(filme["title"] != nil) {
                                tituloOuNome = "title"
                                
                            } else {
                                tituloOuNome = "name"
                                
                            }
                            if(filme["release_date"] != nil) {
                                
                                lancaOuEstreia = "release_date"
                                
                            } else {
                                lancaOuEstreia = "first_air_date"
                            }
                            
                            
                            guard let id = filme["id"] else { return }
                            guard let nomeAtual = filme[tituloOuNome] else { return }
                            guard let caminhoAtual = filme["poster_path"] else { return }
                            guard let sinopseAtual = filme["overview"] else { return }
                            guard let dataDeLancamento = filme[lancaOuEstreia] else { return }
                            filmeAtual = [
                                "id":id,
                                "nome":nomeAtual,
                                "caminho":caminhoAtual,
                                "sinopse":sinopseAtual,
                                "lancamento":dataDeLancamento
                                
                            ]
                            
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
    func getImagens(_ pagina:Int=1, completion: @escaping(_ filmes: [[String:Any]]) ->Void) {
        
        getFilmes(pagina) { (filmes) in
            
            var filmesProntos:[[String:Any]] = [[:]]
            
            for filme in filmes {
                
                if let filmeCaminho = filme["caminho"] as? String {
                
                    guard let nome = filme["nome"] else { return }
                    guard let id = filme["id"] else { return }
                    
                    guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(filmeCaminho)") else { return }
                    
                    var filmeAtual:[String:Any] = [:]
                    
                    Alamofire.request(url, method: .get).responseImage(completionHandler: { (response) in
                        switch response.result {
                            case .success:
                                
                                if let image = response.result.value {
                                    
                                    filmeAtual = [
                                        "nome":nome,
                                        "imagem":image,
                                        "id":id
                                    ]
                                    
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
    func pegarDetalhesPelo(id:Int, pagina:Int,completion: @escaping(_ filme:[[String:Any]]) -> Void)  {
        getFilmes(pagina) { (filmes) in
            
            let filmeSelecionado = filmes.filter({ filmeAtual in
                
                guard let filme = filmeAtual["id"] as? Int else { return false }
                
                return filme == id
                
            })
            
            completion(filmeSelecionado)
        }
    }
}
