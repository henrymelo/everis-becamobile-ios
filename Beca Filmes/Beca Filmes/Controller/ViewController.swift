//
//  ViewController.swift
//  Beca Filmes
//
//  Created by Lucas Abdel Leitao on 07/01/21.
//  Copyright © 2021 Lucas Abdel Leitao. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tabelaFilmes: UITableView!
    
    
    var listaDeFilmes: [Result] = []
    let client = FilmesAPI()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaFilmes.dataSource = self
        self.tabelaFilmes.delegate = self
        
        listarFilmes()

    }
    
    func listarFilmes() {
        client.recebeTendenciasFilmes { (response) in
            self.listaDeFilmes = response
            self.tabelaFilmes.reloadData()
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeFilmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        let filme = listaDeFilmes[indexPath.row]
        
        celula.imageView?.loadImage(imgpath: filme.posterPath)
        
        if filme.title == nil {
            celula.textLabel?.text = filme.name
        }else{
            celula.textLabel?.text = filme.title
        }
        return celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "detalhes") as? DetalhesViewController{
            vc.filme = listaDeFilmes[indexPath.row]
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
