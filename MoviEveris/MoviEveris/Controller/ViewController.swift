//
//  ViewController.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    private var count: Int = 0
    
    
    

    @IBOutlet weak var labelTituloFilme: UILabel!
    @IBOutlet weak var posterFilme: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apresentaFilmeDetalhado()
        apresentaJSONFilmes()
//        FilmeCollectionViewCell().imagemFilme()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        FilmeAPI().getFilmes { (listaDeFilmes) in
            if let listaDeFilmes = listaDeFilmes {
                self.count = listaDeFilmes.count
                print(self.count)
            }
        }
        return self.count
    }
    
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFilmes")
        cell?.textLabel?.text = "20"
        return cell!
    }
    
    func apresentaFilmeDetalhado() {
        FilmeAPI().getDetalhes { (listaDeFilme) in
            if let listaDeFilme = listaDeFilme{
                guard let titulo = listaDeFilme.title else { return }
                guard let id = listaDeFilme.id else { return }
                print(titulo, ":", id, "")
                self.labelTituloFilme.text = titulo
                
                
            }
        }
    }
    
    func apresentaJSONFilmes() {
        FilmeAPI().getFilmes { (jsonFilmes) in
            if jsonFilmes != nil {
                for jsonFilme in jsonFilmes!{
                    guard let id = jsonFilme["id"] as? Int else { return }
                    guard let titulo = jsonFilme["title"] as? String else { return }
                    guard let sinopse = jsonFilme["overview"] as? String else { return }
                    guard let rating = jsonFilme["vote_average"] as? Double else { return }
                    
                    let filme = Filme(id, titulo, sinopse, rating)
                    print("\(filme.id) : \(filme.titulo)")
                    
                }
            }
        }
    }
}


