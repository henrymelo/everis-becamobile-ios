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

    func recuperaFilmes(completion: @escaping ([Filmes]) -> Void) {
        
            guard let key = Configuracao().getKeyPadrao() else { return }

        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=\(key)&language=pt-BR", method: .get).responseJSON { ( response ) in
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
    
    // MARK: Get Detalhes

    func detalheFilme() {
        
            guard let key = Configuracao().getKeyPadrao() else { return }
        
        self.recuperaFilmes { (filme) in
            for detalheFilme in filme {
                let id = detalheFilme.id
                Alamofire.request("https://api.themoviedb.org/3/movie/\(id)?api_key=\(key)&language=pt-BR", method: .get).responseJSON { ( response ) in
                    switch response.result {
                    case .success:
                        guard let detalheRecuperado = response.data else { return }
                        guard let detalhe = try? JSONDecoder().decode(Filme.self, from: detalheRecuperado) else { return }
                        let nomeFilme = detalhe.originalTitle
                        let imagemFilme = detalhe.posterPath
                        print(nomeFilme + imagemFilme)
                        break
                    case .failure:
                        print(response.error!)
                        break
                    }
                }
                
            }
        }
    }
}
