//
//  HomeTableViewController.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 07/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var filmesCollectionView: UICollectionView!
    
    let filmesAPI = FilmesRequisition()
    var filmesToShow:[[String:Any]] = [[:]]
    var paginaAtual:Int = 1
    var carregamento = SpinerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmesCollectionView.dataSource = self
        filmesCollectionView.delegate = self
        
        recuperaImages()
    }
    // MARK: - Collection data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmesToShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
    
        let filmeAtual = filmesToShow[indexPath.item]
        
        guard let imagem = filmeAtual["imagem"] as? UIImage else { return celulaFilme }
        guard let titulo = filmeAtual["nome"] as? String else { return celulaFilme }
        
        celulaFilme.imagemFilme.image = imagem
        
        
        celulaFilme.tituloFilme.text = titulo
        
        return celulaFilme
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filme = filmesToShow[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesFilmeViewController
        
        controller.filmeSelecionado = filme
        controller.paginaAtual = paginaAtual
        
        self.present(controller, animated: true, completion: nil)
        
    }

    func recuperaImages() {
        
        //carregamento.showSpinner(onView: self.view)
        
        filmesAPI.getImagens { (filmes) in
            self.filmesToShow = filmes
            if(self.filmesToShow.count>9) {
                self.filmesToShow.remove(at: 0)
                self.filmesCollectionView.reloadData()
            }
        }
        
    }
    @IBAction func carregaPaginaAnterior(_ sender: UIButton) {
        if(paginaAtual != 1) {
            paginaAtual = paginaAtual - 1
            recuperaImages()
        } else {
            print("Voce esta na primeira página")
        }
        
    }
   
    @IBAction func botaoProximaPagina(_ sender: UIButton) {
        paginaAtual = paginaAtual + 1
        print(paginaAtual)
        
        filmesAPI.getImagens(paginaAtual) { (filmes) in
            
            self.filmesToShow = filmes
            if(self.filmesToShow.count > 20) {
                self.filmesCollectionView.reloadData()
            }
            
            
        }
        
    }
}
