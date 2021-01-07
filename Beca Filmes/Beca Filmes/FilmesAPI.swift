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
    func recebeTendenciasFilmes(){
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=2536c8a939fafc0cfd57dcda9d9ce039&language=pt-BR", method: .get).responseJSON { (resposta) in
            switch resposta.result{
            case .success:
                print(resposta.result.value!)
                break
            case .failure:
                print(resposta.error!)
                break
            }
        }
    }
    
    func recebeDetalhesFilme(){
        Alamofire.request("https://api.themoviedb.org/3/movie/454626?api_key=2536c8a939fafc0cfd57dcda9d9ce039&language=pt-BR", method: .get).responseJSON { (resposta) in
            switch resposta.result{
            case .success:
                print(resposta.result.value!)
                break
            case .failure:
                print(resposta.error!)
                break
            }
        }
    }

}


