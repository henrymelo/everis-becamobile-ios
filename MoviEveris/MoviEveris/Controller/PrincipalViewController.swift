//
//  PrincipalViewController.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/10/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var colecaoFilmes: UICollectionView!
    

    let filmesAPI = FilmeAPI()
    var filmesToShow:[[String:Any]] = [[:]]
    var paginaAtual:Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self
        
        recuperaImages()
    }
    // MARK: - Collection data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(filmesToShow.count)
        return filmesToShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
        
        let filmeAtual = filmesToShow[indexPath.item]
        
        guard let imagem = filmeAtual["poster"] as? UIImage else { return celulaFilme }
        guard let titulo = filmeAtual["titulo"] as? String else { return celulaFilme }
        
        celulaFilme.posterFilme.image = imagem
        celulaFilme.labelTitulo.text = titulo
        celulaFilme.configuraCelula ()
        
        return celulaFilme
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filme = filmesToShow[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalheFilmeViewController
        
        controller.filmeSelecionado = filme
        
        self.present(controller, animated: true, completion: nil)
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2, height: 185) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
//    }
    func recuperaImages() {
        
        filmesAPI.getImagens { (filmes) in
            self.filmesToShow = filmes
            if(self.filmesToShow.count>9) {
                self.filmesToShow.remove(at: 0)
                self.colecaoFilmes.reloadData()
            }
        }
    }
    func carregaProximaPagina() {
        
        filmesAPI.getImagens() { (filmes) in
            let filmesAtuais = filmes
            
            self.filmesToShow = filmesAtuais
            self.colecaoFilmes.reloadData()
            
        }
        
    }
}
