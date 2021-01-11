//
//  ViewController.swift
//  Filmes
//
//  Created by Letycia Sobrinho Marques on 07/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // variáveis
    let filme:FilmesAPI = FilmesAPI("fda3fa048b5dd1721be8d5512626b16a")
    var meusFilmes:[[String:Any]] = [[:]]
    var primeiraPagina: Int = 1
   
    override func viewDidLoad() {
        super.viewDidLoad()
        filmesDisponiveis.dataSource = self
        filmesDisponiveis.delegate = self
        mostraImagem()
    }
    
    //MARK:IBAction
    
  
    
    //MARK:IBOutlet
    
    @IBOutlet weak var filmesDisponiveis: UICollectionView!
    
    
    
    //MARK: Metodos
    
    func mostraImagem() {
        filme.baixarImagens { (retornoDosFilmes) in
            self.meusFilmes = retornoDosFilmes
            
            self.filmesDisponiveis.reloadData()
        }
    }
    
    // MARK:Collection Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.meusFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilmes = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilmes", for: indexPath) as! ListaDeFilmesCollectionViewCell
        let recenteFilme = self.meusFilmes[indexPath.item]
        guard let capa = recenteFilme["imagem"] as? UIImage else {
            return celulaFilmes
        }
        guard let titulo = recenteFilme["titulo"] as? String else { return celulaFilmes }
        
        celulaFilmes.imagemFilme.image = capa
        celulaFilmes.tituloFilme.text  = titulo
        
        return celulaFilmes
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filmeDetalhe = self.meusFilmes[indexPath.item]
        let mainStory = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainStory.instantiateViewController(withIdentifier: "detalhe_filme") as! DetalhesDoFilmeViewController
        
        controller.meusFilmes = filmeDetalhe
        
        self.present(controller, animated: true, completion: nil)
    }
    
  }


