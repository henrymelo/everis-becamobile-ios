//
//  ViewController.swift
//  Beca Filmes
//
//  Created by Lucas Abdel Leitao on 07/01/21.
//  Copyright © 2021 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tabelaFilmes: UITableView!
    
    var listaFilmes: Array<String>?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaFilmes.dataSource = self
//        FilmesAPI().recebeTendenciasFilmes { (resultado) in
//            print(resultado)
//        }
        listarFilmes  { (filme) in
            self.listaFilmes = filme
            print(self.listaFilmes)
        }
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        celula.textLabel?.text = self.listaFilmes?[indexPath.row]
        
        return celula
    }
    
}

