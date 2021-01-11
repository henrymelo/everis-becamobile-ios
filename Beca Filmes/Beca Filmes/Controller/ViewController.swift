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
    
    
    var listaFilmes: Array<String>?
    var listaDetalhes: Array<String>?
    var listaImagens: Array<Image>?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaFilmes.dataSource = self
        self.tabelaFilmes.delegate = self
        filmeImagens { (response) in
            self.listaImagens = response
        }
//        FilmesAPI().recebeTendenciasFilmes { (resultado) in
//            print(resultado)
//        }
        listarFilmes  { (filme) in
            self.listaFilmes = filme
            guard self.listaFilmes != nil else{return}
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
    
    func filmeImagens(completion: @escaping ([Image]) -> Void){
        FilmesAPI().recebeTendenciasFilmes { (resultado) in
            var listaImagens: [Image] = []
            for filme in resultado{
                let imgpath = filme.posterPath
                let url = "https://image.tmdb.org/t/p/w500/\(imgpath)"
                Alamofire.request(url).responseImage(completionHandler: { (response) in
                    if let image = response.result.value {
                        listaImagens.append(image)
                        print("image downloaded: \(image)")
                    }
                    completion(listaImagens)
                })
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        let filme = listaFilmes?[indexPath.row]
        let imagem = listaImagens?[indexPath.row]
        
        celula.imageView?.image = imagem
        celula.textLabel?.text = filme
        
    
        return celula
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

