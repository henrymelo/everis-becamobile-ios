//
//  FilmesAPI.swift
//  cinesofa
//
//  Created by Fabricio Rodrigo Baixo on 1/7/21.
//  Copyright © 2021 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FilmesAPI: NSObject {
    
    let filmes:String = "https://api.themoviedb.org/3/trending/all/week?api_key=214c206d6a89ab0b5b38efbcc5a71587&language=pt-BR"
    let detalhesFilme:String = "https://api.themoviedb.org/3/movie/454626?api_key=214c206d6a89ab0b5b38efbcc5a71587&language=pt-BR"

    func maisVistosDaSemana(){
        
        Alamofire.request(filmes,method: .get).responseJSON { (retorno) in
            if retorno.result.isSuccess{
                print(retorno.result.value!)
            }
            if retorno.result.isFailure{
                print("Falha no retorno da API")
            }
        }
    }
    
    func informacoesFilme(){
        
        Alamofire.request(detalhesFilme,method: .get).responseJSON { (retorno) in
            if retorno.result.isSuccess{
                print(retorno.result.value!)
            }
            if retorno.result.isFailure{
                print("Falha no retorno da API")
            }
        }
    }
}
