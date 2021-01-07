//
//  TendenciasFilmesViewController.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit
import AlamofireImage

class TendenciasFilmesViewController: UIViewController, UICollectionViewDataSource {
    
    //MARK: - Outlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    //MARK: - Variaveis
    
    var listaTendenciaFilmes:Array<Dictionary<String, Any>> = []
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colecaoFilmes.dataSource = self
        
        FilmeAPI().pegarListaTendenciasFilmes { (resposta) in
            self.listaTendenciaFilmes = resposta
            self.colecaoFilmes.reloadData()
        }
        
        FilmeAPI().pegarDetalhesFilme(codFilme: "464052") { (resposta) in
            //print(resposta["title"])
        }

    }
    
    //MARK: - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaTendenciaFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let filme = listaTendenciaFilmes[indexPath.row]
        
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
        

        celula.labelTituloFilme.text = filme["title"] as? String

        if let filmePosterLink = filme["poster_path"] {
            if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(filmePosterLink)"){
                print("https://image.tmdb.org/t/p/w500\(filmePosterLink)")
                celula.imageFilme.af_setImage(withURL: imageUrl)
            }
        }
        
        
        return celula
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
