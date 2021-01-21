//
//  Filme.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 07/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit


class Filme: NSObject {
    
    
    var trending:[[String:Any]] = [[:]]
    var filmesParaProcurarImagem:[[String:Any]]? = [[:]]
    var dicionarioProntoComTrending:[[String:Any]] = [[:]]
    var dicionarioFinal:[[String:Any]] = [[:]]
    
    func criaListaDaTrending(_ lista:[[String:Any]]) -> [[String:Any]]? {
        for filme in lista {
            if(filme["title"] != nil) {
                guard let nomeAtual = filme["title"] else { return nil}
                guard let caminhoAtual = filme["poster_path"] else { return nil }
                let filmeAtual = ["nome":nomeAtual, "caminho":caminhoAtual]
                trending.append(filmeAtual)
                
            } else {
                guard let nomeAtual = filme["name"] else { return nil}
                guard let caminhoAtual = filme["poster_path"] else { return nil}
                let filmeAtual = ["nome":nomeAtual, "caminho":caminhoAtual]
                trending.append(filmeAtual)
            }
   
        }
        
        return trending
    }
    func trendingComImagem(_ bruta: [[String:Any]]) {
  
        guard let filmesParaProcurarImagem = criaListaDaTrending(bruta) as? [[String:Any]] else { return }
    
        let filmeApi = FilmesAPI()
        
        
        for filme in filmesParaProcurarImagem {
            
            
            if let caminho = filme["caminho"] as? String {
                
                filmeApi.getImageOn(caminho) { (imagem) in
                    
                    
                    let atualArray = [
                        "nome":filme["nome"],
                        "imagem":imagem
                    ]
                    self.salvaFilme(atualArray)
                    
                }
            }
        }
        
    }
    func salvaFilme(_ addArray:[String:Any]) {
        dicionarioProntoComTrending.append(addArray)
    }
    
    func mostraFilmes() {
        print(dicionarioProntoComTrending)
    }
    

}
