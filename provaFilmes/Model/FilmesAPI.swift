//
//  FilmesAPI.swift
//  provaFilmes
//
//  Created by Aloisio Formento Junior on 07/01/21.
//  Copyright © 2021 Aloisio Formento Junior. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class FilmesAPI: NSObject {
    
    func getFilmes(completion:@escaping (_ movies:[Filmes]?, _ error:String?) -> Void ) {
        
        let url = "https://api.themoviedb.org/3/trending/all/week?api_key=79b0976a6ec7bd4d968a3ef2d867985d&language=pt-BR"
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let welcome = try decoder.decode(Welcome.self, from: data)
                    completion(welcome.results, nil)
                } catch let error {
                    print(error)
                    completion(nil, error.localizedDescription)
                }
            }else{
                completion(nil, "Data null")
            }
           
            
//            switch response.result{
//            case .success(let value):
//                if let resposta = response.result.value as? Dictionary<String,Any>{
//                    guard let listaDeFilmes = resposta["results"] as? Array<Dictionary<String,Any>> else { return }
//                    for i in listaDeFilmes{
//                        print (i["title"] ?? i["name"]!)
//                    }
//                }
//                break
//
//            case .failure:
//                print(response.error!)
//                break
//            }
        }

    }
    
    
    
    
    
    
    
}


