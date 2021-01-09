//
//  ViewController.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on var01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UITableViewController, RespostaAPI {
    func success(Modelo: ModeloFilme) {
        listaDeFilmes = Modelo
        tableView.reloadData()
    }
    
    func failure() {
        print("deu ruim")
    }
    
    //MARK: Variavies
    
   
    
    var listaDeFilmes: ModeloFilme?
    
    var api =  FilmeAPI()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        api.configura(delegate: self)
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        api.recuperaFilmes()
        
    }
    
    
    //MARK: - Métodos
    
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

        let caminhoDaImagem: String
        caminhoDaImagem = self.listaDeFilmes?.results[indexPath.row].posterPath ?? ""

         let imageUrl = URL(string: "https://image.tmdb.org/t/p/original\(caminhoDaImagem)")

        if let url = imageUrl {
            celula.imagemFilme?.af_setImage(withURL: url)
        }
        
        celula.labelTitulo.text = titulo
        
      
        return celula
    }
    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
}


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "DetalhesViewController") as! DetalhesViewController
//        myVC.stringPassed = caminhoDaImagem
//        navigationController?.pushViewController(myVC, animated: true)
//
//
//
//
////        if segue.identifier == "detalheFilme"{
////
////           if let indexPath = tableView.indexPathForSelectedRow {
////
////                var filmeSelecionado = self.listaDeFilmes?.results[indexPath.row]
////            let viewControllerDestino = segue.destination as! DetalhesViewController
////            viewControllerDestino.listaDeFilmes?.results = filmeSelecionado
////
////            }
////        }
//
//    }
