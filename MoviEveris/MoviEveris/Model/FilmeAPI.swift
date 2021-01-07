//
//  FilmeAPI.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation
import Alamofire

class FilmeAPI {
    
    
    //MARK: - Atributos
    
    let urlBase = "https://api.themoviedb.org"
    let apiKey = "?api_key=96dd278d45abf85bc179831d48f22e83"
    
    //MARK: - GET
    
    func getFilmesPopulares() {
        Alamofire.request("\(urlBase)/3/movie/popular\(apiKey)", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                print(response.result.value!)
                break
            case .failure:
                print(response.error!)
                break
        
            }
    
        }
    }
}

