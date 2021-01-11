//
//  ViewController.swift
//  PolibioFilms
//
//  Created by Artur Rodrigues Fortunato on 09/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    @IBOutlet weak var filmesCollectionView: UICollectionView!
    
    var listaDeFilmes: [[String:Any]] = [[:]]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        chamarAPI()
        filmesCollectionView.dataSource = self
        filmesCollectionView.delegate = self
        
    }
    
    func chamarAPI(){
       
        ReceberAPI().consumindoAPI { (filmes) in
            self.listaDeFilmes = filmes
            self.filmesCollectionView.reloadData()
            
        }

    }
    //MARK: - Editando Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaDeFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! FilmesCollectionViewCell
        
        let filmeAtual = listaDeFilmes[indexPath.row]
        
        guard let imagem = filmeAtual["poster_path"] as? String else {return celulaFilme}
        
        
        celulaFilme.capaFilme.af_setImage(withURL: URL(string: "https://image.tmdb.org/t/p/w185\(imagem)")!)
     
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let filmeSelecionado = listaDeFilmes[indexPath.item]
    //cria variavel pra recuperar o storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

    //cria variavel para recuperar o viewcontroller dos detalhes e  "as!" converte a apresentacao para o arquivo ShowDetailsViewController
        let controller = storyboard.instantiateViewController(withIdentifier: "showDetails") as! ShowDetailsViewController
        
        let tituloDoFilmeSelecionado = filmeSelecionado["title"] as? String ?? filmeSelecionado["name"] as? String
        controller.tituloFilme = tituloDoFilmeSelecionado
        
        let resumoDoFilmeSelecionado = filmeSelecionado["overview"] as? String
        controller.resumoFilme = resumoDoFilmeSelecionado
        
        let avaliacaoFilme = filmeSelecionado["vote_avorage"]  as? Double
        controller.avaliacao = avaliacaoFilme
        
        
    //apresenta o viewcontroller na tela
        self.navigationController?.pushViewController(controller, animated: true)
    
        
    }
    
}
