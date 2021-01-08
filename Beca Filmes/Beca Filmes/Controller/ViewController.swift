//
//  ViewController.swift
//  Beca Filmes
//
//  Created by Lucas Abdel Leitao on 07/01/21.
//  Copyright © 2021 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        FilmesAPI().recebeTendenciasFilmes { (resultado) in
//            print(resultado)
//        }
//        listarFilmes { (filme) in
//            print(filme)
//        }
        FilmesAPI().recebeDetalhesFilme()
    }
    
    func listarFilmes(completion: @escaping ([String]) -> Void){
        var lista: [String] = []
        FilmesAPI().recebeTendenciasFilmes { (resultado) in
            for filme in resultado{
                if filme.title == nil{
                    guard let titulo = filme.name else{return}
                    lista.append(titulo)
                }else{
                    guard let tituloFilme = filme.title else{return}
                    lista.append(tituloFilme)
                }
                
            }
            completion(lista)
        }
    }
    
    func filmeImagens(){
        FilmesAPI().recebeTendenciasFilmes { (resultado) in
            print(resultado)
        }
    }
    
}

