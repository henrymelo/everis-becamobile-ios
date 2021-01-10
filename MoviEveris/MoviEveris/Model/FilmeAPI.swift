//
//  FilmeAPI.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class FilmeAPI: NSObject {
    
    //MARK: - Atributos
    
    let urlBase = "https://api.themoviedb.org"
    let apiKey = "?api_key=96dd278d45abf85bc179831d48f22e83"
    
    //MARK: - GET
    
    func getFilmes () {
        Alamofire.request("\(urlBase)/3/trending/movie/week\(apiKey)&language=pt-BR&page=1", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
}
