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
        let filme = listaDeFilmes?.results[indexPath.row]
        
        let titulo: String
        if filme?.mediaType == "movie" {
            titulo = filme?.originalTitle ?? ""
        }else{
            titulo = self.listaDeFilmes?.results[indexPath.row].originalName ?? ""
        }

        let caminhoDaImagem: String
        caminhoDaImagem = filme?.posterPath ?? ""

         let imageUrl = URL(string: "https://image.tmdb.org/t/p/original\(caminhoDaImagem)")

        if let url = imageUrl {
            celula.imagemFilme?.af_setImage(withURL: url)
            celula.imagemFilme?.layer.cornerRadius = 40;
            celula.imagemFilme?.layer.masksToBounds = true;
        }
    
        celula.labelTitulo.text = titulo
        
        return celula
    }
    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmes = listaDeFilmes?.results[indexPath.row]
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetalhesFilmes") as! DetalhesFilmesViewController
        
        controller.listaDeFilmes = filmes
        self.navigationController?.pushViewController(controller,animated: true)
    }
    
    
}
