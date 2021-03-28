//
//  FilmesAPI.swift
//  app-filmes
//
//  Created by Gabriel Santos Souza on 19/01/21.
//

import UIKit
import Alamofire

class FilmesAPI: NSObject {
    
    // MARK: - GET
    
    func listaTendencias(completion:@escaping(Array<Dictionary<String, Any>>) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=e8606b85a11ce3fb1de18d901be3f16c&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String, Any> {
                    guard let listaDeTendencias = resposta["results"] as? Array<Dictionary<String, Any>> else { return }
                    completion(listaDeTendencias)
                }
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    
    func buscaURLImagem(link:String) -> URL?{
        
        guard let imagem = URL(string: "https://image.tmdb.org/t/p/w500\(link)") else { return nil }
        return imagem
    }

}
