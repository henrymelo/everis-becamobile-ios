//
//  ViewController.swift
//  app-filmes
//
//  Created by Gabriel Santos Souza on 19/01/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
        celula.layer.borderWidth = 0.5
        celula.layer.borderColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1).cgColor
        celula.layer.cornerRadius = 8
        
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
    
    // MARK: - CollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/2 - 10, height: collectionView.bounds.height/2 - 15)
    }

}
