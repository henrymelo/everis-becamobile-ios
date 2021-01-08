//
//  FilmesAPI.swift
//  beca-filmes
//
//  Created by Gabriel Santos Souza on 07/01/21.
//  Copyright © 2021 Gabriel Santos Souza. All rights reserved.
//

import UIKit
import Alamofire

class FilmesAPI: NSObject {
    
    // MARK: - GET
    
    func listaTendencias() {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=e8606b85a11ce3fb1de18d901be3f16c&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String, Any> {
                    guard let listaDeTendencias = resposta["results"] as? Array<Dictionary<String, Any>> else {
                        print("Deu ruim no início")
                        return
                    }
                    for dicionarioDeFilmes in listaDeTendencias {
                        FilmesDAO().salvaFilmes(dicionarioDeFilmes: dicionarioDeFilmes)
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
