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

    let filmesTrendingHome:[String:Any] = [:]
    
    
    // MARK: - Métodos
    
    func getTrendingMovies() {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=\(myKey)&language=pt-BR") else { return }
        
        Alamofire.request(url, method: .get).responseJSON(completionHandler: { (response) in
            
            switch response.result {
               
                case .success:
                    if let resposta = response.result.value as? [String:Any] {
                        
                        guard let filmes = resposta["results"] as? [[String:Any]] else { return }
                        
                        for filme in filmes {
                            
                            guard let movieName = filme["title"] else { return }
                            guard let imagemPath = filme["backdrop_path"] as? String else { return }
                            
                            print(movieName)
                            self.getImageOn(imagemPath, completion: { (imagem) in
                                
                                print(imagem)
                                
                            })
                        }

                    }
                    break
                
                case .failure:
                
                    print(response.error!)
                    break
                
            }
        })
    }
    func getImageOn(_ pathLink: String, completion: @escaping(_ image:UIImage)->Void) {
        
        guard let url = URL(string: "\(imageUrl)\(pathLink)") else { return}
        
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

