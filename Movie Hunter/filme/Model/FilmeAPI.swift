//
//  FilmeAPI.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 07/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit
import Alamofire

class FilmeAPI: NSObject {
    
    // MARK - GET Filmes
    
    func recuperaFilmes() {
        
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=aca6f73c8c15f59d9c85fcf92f0d3281&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String, Any> {
                    guard let listaDeFilmes = resposta["filmes"] as? Array<Dictionary<String, Any>> else { return }
                    for dicionarioDeFilme in listaDeFilmes {
                        FilmeDAO().exibeFilme(dicionarioDeFilme: dicionarioDeFilme)
                    }
                }
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
}
