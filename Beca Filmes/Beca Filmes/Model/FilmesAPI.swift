//
//  FilmesAPI.swift
//  Beca Filmes
//
//  Created by Lucas Abdel Leitao on 07/01/21.
//  Copyright © 2021 Lucas Abdel Leitao. All rights reserved.
//

import UIKit
import Alamofire

class FilmesAPI: NSObject {
    
    // MARK: - Get
    func recebeTendenciasFilmes(completion: @escaping ([Result]) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=2536c8a939fafc0cfd57dcda9d9ce039&language=pt-BR", method: .get).responseJSON { (resposta) in
            switch resposta.result{
            case .success:
                
                guard let jsonData = resposta.data else {return}
                guard let welcome = try? JSONDecoder().decode(Filme.self, from: jsonData) else {return}
                
                let filmes = welcome.results
                
                completion(filmes)
                
                break
            case .failure:
                print(resposta.error!)
                break
                }
            }
    }
    func recebeDetalhesFilme(completion: @escaping (Any)->Void){
        var listaTodosDetalhes:[[String: Any]] = [[:]]
        self.recebeTendenciasFilmes { (filmes) in
            for filme in filmes{
                let id = filme.id
                let media = filme.mediaType
                Alamofire.request("https://api.themoviedb.org/3/\(media)/\(id)?api_key=2536c8a939fafc0cfd57dcda9d9ce039&language=pt-BR", method: .get).responseJSON { (resposta) in
                    switch resposta.result{
                    case .success:
                        guard let jsonData = resposta.data else{return}
                        guard let detalhes = try? JSONDecoder().decode(FilmeDetalhes.self, from: jsonData) else {return}
                        
//                        let poster = detalhes.posterPath
//                        let titulo = detalhes.title
//                        let nome = detalhes.name
//                        let descricao = detalhes.overview
//                        if detalhes.title == nil{
//                            print(detalhes.name)
//                        }else{print(detalhes.title)}
                        
                        
                        
                        break
                    case .failure:
                        print(resposta.error!)
                        break
                    }
                }

            }
//            print(listaTodosDetalhes)
//            completion (listaTodosDetalhes)
        }
    }
    
}
