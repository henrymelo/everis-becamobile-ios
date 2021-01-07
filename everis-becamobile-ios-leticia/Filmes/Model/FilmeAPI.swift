//
//  FilmeAPI.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 07/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import Alamofire

class FilmeAPI: NSObject {
    
    // MARK: - Requisição GET
    
        func recuperaTendenciasServidor() {
            let request: DataRequest = Alamofire.request("https://api.themoviedb.org/3/trending/movie/week?api_key=4d3af2ecd868ddee8ae767825e9a0d64&language=pt-BR")
            
            request.responseData { receive in
                guard let data: Data = receive.data, let filmes: Filmes = try? JSONDecoder().decode(Filmes.self, from: data) else {
                    print("falha ao decodificar dados")
                    return
                }
                
                print(filmes.all[0].title)
                
            }
        }
        
        
//        func recuperaDetalhesServidor() {
//            let request: DataRequest = Alamofire.request("https://api.themoviedb.org/3/movie/454626?api_key=4d3af2ecd868ddee8ae767825e9a0d64&language=pt-BR")
//
//            request.responseData { receive in
//                guard let data: Data = receive.data, let filmes: Filmes = try? JSONDecoder().decode(Filmes.self, from: data) else {
//                    print("falha ao decodificar dados")
//                    return
//                }
//
//                print(filmes.all[0].overview)
//            }
//        }

}
