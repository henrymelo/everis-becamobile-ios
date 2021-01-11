//
//  FilmeAPI.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 07/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation
import Alamofire

protocol filmesProtocolo: class {
    func recuperaFilmes(pagina:Int)
}

protocol RespostaAPI {
    func success(Modelo: ModeloFilme)
    func failure()
}

class FilmeAPI: NSObject, filmesProtocolo {
    
    var delegate: RespostaAPI?

    func configura(delegate: RespostaAPI){
        self.delegate = delegate
    }
    

    
    // MARK: - GET

    func recuperaFilmes(pagina:Int)  {
        
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=5287ae8d76c11e98a09d2b4dfe0f443e&language=pt-BR&page=\(pagina)") else {return}
        Alamofire.request(url , method: .get).responseJSON { (response) in

            switch response.result{
                
            case .success:
                
                if (response.result.value as? Dictionary<String, Any>) != nil {
                    do {
                        guard let data = response.data else {return}
                        let objetoFilme = try JSONDecoder().decode(ModeloFilme.self, from: data)
                        self.delegate?.success(Modelo: objetoFilme)
                        
                
                    } catch {
                        print("Falhou aqui")
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





