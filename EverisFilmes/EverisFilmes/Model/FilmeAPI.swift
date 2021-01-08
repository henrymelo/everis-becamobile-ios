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
    func recuperaFilmes()
}

protocol RespostaAPI {
    func success(Modelo: ModeloFilme)
    func failure()
}

class FilmeAPI: NSObject, filmesProtocolo {
    
    var delegate: RespostaAPI?
    
   
    
    // MARK: - GET
    
    func configura(delegate: RespostaAPI){
        self.delegate = delegate
    }

    func recuperaFilmes()  {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=cf692353d76cfc50bc34648eb54b621f&language=pt-BR", method: .get).responseJSON { (response) in
//                print(response.result.value!)
            switch response.result{
                
            case .success:
                
                if let resposta = response.result.value as? Dictionary<String, Any> {
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
