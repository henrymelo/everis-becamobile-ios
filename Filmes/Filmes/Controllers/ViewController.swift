//
//  ViewController.swift
//  Filmes
//
//  Created by Letycia Sobrinho Marques on 07/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    var listaFilmes:Array<String> = ["Mulher Maravilha"]
    let minhaChave:String = "fda3fa048b5dd1721be8d5512626b16a"
    let urlFilmes:String = "https://api.themoviedb.org/3/trending/all/week?api_key=fda3fa048b5dd1721be8d5512626b16a&language=pt-BR"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        importarFilmes()
    }
    
    func importarFilmes() {
        Alamofire.request(urlFilmes, method: .get)
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    if let resultado = response.result.value as? Dictionary<String, Any> {
                        guard let lista = resultado["results"] as? Array<Dictionary<String,Any>>
                        else {return}
                        print(lista)
                    }
                    break
                    
                case .failure:
                    print(response.error!)
                break
                    
                }
            }
    }
    
    

}

