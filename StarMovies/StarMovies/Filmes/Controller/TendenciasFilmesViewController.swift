//
//  TendenciasFilmesViewController.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit
import AlamofireImage

class TendenciasFilmesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  , UICollectionViewDelegateFlowLayout{
    
    //MARK: - Outlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    //MARK: - Variaveis
    
    var listaTendenciaFilmes:Array<Dictionary<String, Any>> = []
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colecaoFilmes.dataSource = self
        self.colecaoFilmes.delegate = self
        
        FilmeAPI().pegarListaTendenciasFilmes { (resposta) in
            self.listaTendenciaFilmes = resposta
            self.colecaoFilmes.reloadData()
        }

    }
    
    //MARK: - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaTendenciaFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
        
        celula.configurarCelula(Filme(listaTendenciaFilmes[indexPath.row]))
        celula.aplicarSombrar()
    
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = view.frame.size.height
        let width = view.frame.size.width
        
        let dimensaoDaTela = Int(height/width)

        if dimensaoDaTela < 2 {
        return CGSize(width: width * 0.43, height: height * 0.43)
        }else{
        return CGSize(width: width * 0.43, height: height * 0.37)
        }
    }
    
    //MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filmeDicionario = listaTendenciaFilmes[indexPath.item]
        guard let codigoFilme = filmeDicionario["id"] as? Int else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesFilme") as! DetalhesFilmeViewController
        
        FilmeAPI().pegarDetalhesFilme(codFilme: codigoFilme, completion: { (resposta) in
            let filmeDetalhado = Filme(resposta)
            controller.filmeSelecionado = filmeDetalhado
            self.navigationController?.pushViewController(controller, animated: true)
        })
        
    }
    

}
