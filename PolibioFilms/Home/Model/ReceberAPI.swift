//
//  ReceberAPI.swift
//  PolibioFilms
//
//  Created by Artur Rodrigues Fortunato on 07/01/21.
//

import UIKit
import Alamofire
import AlamofireImage


class ReceberAPI: NSObject {

    var listaDeFilmes:[[String:Any]] = [[:]]
    
    let urlAPI = "https://api.themoviedb.org/3/trending/all/week?api_key="
    let urlPosterPath = "https://image.tmdb.org/t/p/w185"
    let token = "4c952a66aec922c199eb9a89786edb85"
    var language = "&language=pt-BR"

    
    func consumindoAPI(completion: @escaping (_ filmes:[[String:Any]]) -> Void){
        guard let urlApi = URL(string: "\(urlAPI)\(token)\(language)") else {return}
        Alamofire.request(urlApi, method: .get).responseJSON { (response) in
            switch response.result{
            case .success:
                
                if let json = response.result.value as? [String:Any] {
                    guard let respostasJson = json["results"] as? [[String:Any]] else {return}
                    self.listaDeFilmes = respostasJson
                    completion(self.listaDeFilmes)
                }

                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    
}
