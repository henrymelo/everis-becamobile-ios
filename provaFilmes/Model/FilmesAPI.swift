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
    
    func getFilmes(){
        
        let url = "https://api.themoviedb.org/3/trending/all/week?api_key=79b0976a6ec7bd4d968a3ef2d867985d&language=pt-BR"
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result{
            case .success:
                if let resposta = response.result.value as? Dictionary<String,Any>{
                    guard let listaDeFilmes = resposta["results"] as? Array<Dictionary<String,Any>> else { return }
                    for i in listaDeFilmes{
                        print (i["title"] ?? i["name"]!)
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


