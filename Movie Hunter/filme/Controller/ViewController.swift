//
//  ViewController.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 07/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    //MARk: - IBOutlets
    @IBOutlet weak var collectionFilmes: UICollectionView!

    

    
    // MARK: - Variáveis
    var listaFilme: [Filme] = []

    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionFilmes.dataSource = self
        collectionFilmes.delegate = self
        FilmeAPI().recuperaFilmes { (listaFilmes) in
            print("sucesso")
        }

        
    }
    
    
    // MARK: - Métodos
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView.reloadData()
        return listaFilme.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "filmeCell", for: indexPath) as! CollectionViewCell
        
        let filmeAtual = listaFilme[indexPath.item]
        celulaFilme.configuraCelula(filme: filmeAtual)
        
        collectionView.reloadData()
        
        return celulaFilme
    }
    


}


