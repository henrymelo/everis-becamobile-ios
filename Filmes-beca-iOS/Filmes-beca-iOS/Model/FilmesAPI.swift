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

    let myKey = "122c287761eefdfe3d8bcc0154354e73"
    
    //w500 = width:500px
    let imageUrl = "https://image.tmdb.org/t/p/w500/"
    
    func getTrendingMovies() {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=\(myKey)&language=pt-BR") else { return }
        
    
        
        Alamofire.request(url, method: .get).responseJSON(completionHandler: { (response) in
            
            switch response.result {
               
                case .success:
                    if let resposta = response.result.value {
                        print(resposta)
                    }
                    break
                
                case .failure:
                
                    print(response.error!)
                    break
                
            }
        })
    }
    
}

