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
        
        listarDescricao { (response) in
            self.listaDetalhes = response
        }
        
        listarFilmes  { (filme) in
            self.listaFilmes = filme
            guard self.listaFilmes != nil else{return}
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
    func listarDescricao(completion: @escaping ([String]) -> Void){
        var lista: [String] = []
        FilmesAPI().recebeTendenciasFilmes { (resultado) in
            for filme in resultado{
                let descricao = filme.overview
                lista.append(descricao)
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
        
        let filme = listaFilmes?[indexPath.row]
        let tituloFilme = filme as? String
        vc.titulo = tituloFilme
        
        let imagem = listaImagens?[indexPath.row]
        let imagens = imagem as? UIImage
        vc.imagemPassada = imagens
        
        let resumo = listaDetalhes?[indexPath.row]
        let detalhes = resumo as? String
        vc.descricao = detalhes
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}

