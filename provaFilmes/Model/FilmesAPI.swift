//
//  FilmesAPI.swift
//  provaFilmes
//
//  Created by Aloisio Formento Junior on 07/01/21.
//  Copyright © 2021 Aloisio Formento Junior. All rights reserved.
//

import UIKit
import Alamofire

class FilmesAPI: NSObject {
    
    func getFilmes(){
        
        let url = "https://api.themoviedb.org/3/trending/all/week?api_key=79b0976a6ec7bd4d968a3ef2d867985d&language=pt-BR"
        
        Alamofire.request(url, method: .get).responseJSON { (resposta) in
            switch resposta.result{
            case .success:
                print(resposta)
                break
                
            case .failure:
                print(resposta.error!)
                break
            }
        }

    }
    
    
    
    
    
    
    
}


