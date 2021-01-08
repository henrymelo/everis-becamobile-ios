//
//  ViewController.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 07/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, RespostaAPI {
    func success(Modelo: ModeloFilme) {
        listaDeFilmes = Modelo
        tableView.reloadData()
    }
    
    func failure() {
        print("deu ruim")
    }
    
    
    
    var listaDeFilmes: ModeloFilme?
    
    var api =  FilmeAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        api.configura(delegate: self)
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        api.recuperaFilmes()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listaDeFilmes?.results.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let titulo: String
        if self.listaDeFilmes?.results[indexPath.row].mediaType == "movie" {
            titulo = self.listaDeFilmes?.results[indexPath.row].originalTitle ?? ""
        }else{
            titulo = self.listaDeFilmes?.results[indexPath.row].originalName ?? ""
        }
        
     
        
        celula.labelTitulo.text = titulo
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

    
    
    
    
}


