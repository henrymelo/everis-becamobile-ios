//
//  ViewController.swift
//  beca-filmes
//
//  Created by Gabriel Santos Souza on 07/01/21.
//  Copyright © 2021 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionFilmes: UICollectionView!
    
    // MARK: - Variáveis
    
    var listaDeTendecias: Array<Dictionary<String, Any>> = []
    
    // MARK: - LyfeCicle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.carregaHome()
        collectionFilmes.dataSource = self
        collectionFilmes.delegate = self
    }
    
    func carregaHome() {
        FilmesAPI().listaTendencias { (response) in
            self.listaDeTendecias = response
            self.collectionFilmes.reloadData()
        }
    }

    // MARK: - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaDeTendecias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! TendenciasCollectionViewCell
        
        celula.configuraCelula(Filmes(dicionarioDeFilme: listaDeTendecias[indexPath.row]))
        
        return celula
    }
    
    // MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filmeSelecionado = listaDeTendecias[indexPath.item]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViewController
        
        controller.filmeSelecionado = Filmes(dicionarioDeFilme: filmeSelecionado)
        self.present(controller, animated: true, completion: nil)
    }

}

