//
//  FilmeAPI.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 07/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation
import Alamofire

class FilmeAPI: NSObject {
    
    // MARK: - GET
    
    func getFilmes() {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=cf692353d76cfc50bc34648eb54b621f&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result{
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
