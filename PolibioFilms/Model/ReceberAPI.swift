//
//  ReceberAPI.swift
//  PolibioFilms
//
//  Created by Artur Rodrigues Fortunato on 07/01/21.
//

import UIKit
import Alamofire
import AlamofireImage


class ReceberAPI: NSObject {

    //parametros vai ser os parametros para a criacao do dicionario
    func consumindoAPI(completion: @escaping (Filmes) ->()){
        
        //Criando a variável da URL da API
        guard let urlApi = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=4c952a66aec922c199eb9a89786edb85&language=pt-BR") else {return}
        
        Alamofire.request(urlApi, method: .get).responseJSON {response in
            
            guard let teste = response.data else {return}
            
            do{
                let posts = try JSONDecoder().decode(Filmes.self, from: teste)
                //print(posts)
                completion(posts)
            }
            catch let error{
                print(error.localizedDescription)
            }
        }
        
    
    }
    
  

}
