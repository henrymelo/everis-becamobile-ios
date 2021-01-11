//
//  DetalhesFilmeAPI.swift
//  Filmes
//
//  Created by Letycia Sobrinho Marques on 08/01/21.
//

import UIKit
import Alamofire


class DetalhesFilmeAPI: NSObject {
    
    
  
    
    
    
    // MARK: Variaveis
    
    var listaFilmes:Array<String> = ["Mulher Maravilha"]
    let minhaChave:String = "fda3fa048b5dd1721be8d5512626b16a"
    var urlDetalhesFilmes:String = "https://api.themoviedb.org/3/movie/454626?api_key=fda3fa048b5dd1721be8d5512626b16a&language=pt-BR"
    
    func detalheFilme() {
             
        Alamofire.request(urlDetalhesFilmes, method: .get).responseJSON { (response) in
                switch response.result {
                case .success:
                if let resultado = response.result.value as? Dictionary<String, Any> {
               guard let filme = resultado as? Dictionary<String,Any>
                else {
                        print("Nao deu certo")
                        return
                    }
                print(filme)
                print("deu certo")
                    
                    }
                    break

                case .failure:
              print(response.error!)
                break
                }
        }
    }
}
