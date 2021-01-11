//
//  FilmeAPI.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 07/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class FilmeAPI: NSObject {
    
    // MARK - GET Filmes

    func recuperaFilmes(_ completion: @escaping ([Filme]) -> Void) {
        
            guard let key = Configuracao().getKeyPadrao() else { return }

        Alamofire.request("https://api.themoviedb.org/3/trending/movie/week?api_key=\(key)&language=pt-BR", method: .get).responseJSON { ( response ) in
            switch response.result {
            case .success:
                guard let filmeRecuperado = response.data else { return }
                guard let inicio = try? JSONDecoder().decode(ListaFilmes.self, from: filmeRecuperado) else { return }
                    let filme = inicio.results
                completion(filme)
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    
}
