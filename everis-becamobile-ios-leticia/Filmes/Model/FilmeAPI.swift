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
    
    func testeRecupera() {
        let request = Alamofire.request("https://api.themoviedb.org/3/trending/movie/week?api_key=4d3af2ecd868ddee8ae767825e9a0d64&language=pt-BR")
        // 2
        request.responseDecodable(of: Filmes.self) { (response) in
        guard let filmes = response.value else { return }
        print(filmes.all[0].title)
    }
    
//    func recuperaTendenciasServidor() {
//        Alamofire.request("https://api.themoviedb.org/3/trending/movie/week?api_key=4d3af2ecd868ddee8ae767825e9a0d64&language=pt-BR", method: .get).responseJSON { (response) in
//            switch response.result {
//            case .success:
//                print(response.result.value!)
//                break
//            case .failure:
//                print(response.error!)
//                break
//            }
//        }
//    }
//
//
//    func recuperaDetalhesServidor() {
//        Alamofire.request("https://api.themoviedb.org/3/movie/454626?api_key=4d3af2ecd868ddee8ae767825e9a0d64&language=pt-BR", method: .get).responseJSON { (response) in
//            switch response.result {
//            case .success:
//                print(response.result.value!)
//                break
//            case .failure:
//                print(response.error!)
//                break
//            }
//        }
    }

}
