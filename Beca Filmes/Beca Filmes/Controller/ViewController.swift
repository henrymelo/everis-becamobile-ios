//
//  ViewController.swift
//  Beca Filmes
//
//  Created by Lucas Abdel Leitao on 07/01/21.
//  Copyright © 2021 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tabelaFilmes: UITableView!
    
    
    var listaFilmes: Array<String>?
    var listaDetalhes: Array<String>?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaFilmes.dataSource = self
        self.tabelaFilmes.dataSource = self
//        FilmesAPI().recebeTendenciasFilmes { (resultado) in
//            print(resultado)
//        }
        listarFilmes  { (filme) in
            self.listaFilmes = filme
            guard let listaDeFilmes = self.listaFilmes else{return}
        }
        FilmesAPI().recebeDetalhesFilme { (filme) in
            self.listaDetalhes
        }
        self.tabelaFilmes.reloadData()
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
        
        celula.textLabel?.text = listaFilmes?[indexPath.row]
        
        return celula
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        self.navigationController?.pushViewController(DetalhesViewController(), animated: true)
        print("apertou")
    }
    
    
}

