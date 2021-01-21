//
//  FilmesAPI.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 07/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FilmesAPI: NSObject {

    // MARK: - Variáveis
    let myKey = "122c287761eefdfe3d8bcc0154354e73"
    
    //w500 = width:500px
    let imageUrl = "https://image.tmdb.org/t/p/w500"

    var nomeDoFilme = ""
    var imagemFilme:UIImage? = nil
    
    
    var currentMovie:[String:Any] = [:]
    var filmesTrendingHome:[[String:Any]] = [[:]]
    
    
    // MARK: - Métodos
    
    func getTrendingMovies(completion:@escaping(_ filmes:[[String:Any]])->Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=\(myKey)&language=pt-BR") else { return }
        
        Alamofire.request(url, method: .get).responseJSON(completionHandler: { (response) in
            
            switch response.result {
               
                case .success:
                    if let resposta = response.result.value as? [String:Any] {
                        
                        guard let filmes = resposta["results"] as? [[String:Any]] else { return }
                        
  
                        self.filmesTrendingHome = filmes
                        
                        completion(self.filmesTrendingHome)
                       
                    }
                    break
                
                case .failure:
                
                    print(response.error!)
                    break
            }
        })
        print(filmesTrendingHome)
    }
    func getImageOn(_ pathLink: String, completion:@escaping(UIImage)->Void) {
        
        guard let url = URL(string: "\(imageUrl)\(pathLink)") else { return }
        
        Alamofire.request(url, method: .get).responseImage { (response) in
            switch response.result{
                case .success:
                    
                    if let image = response.result.value {
                        
                        completion(image)
                        
                    }
                    break
                
                case .failure:
                
                    print(response.error!)
                    break
            }
        }
    }
}

