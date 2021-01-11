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
    var listaDeFilme: [Filme] = []
    
    
   
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionFilmes.dataSource = self
        collectionFilmes.delegate = self
        FilmeAPI().recuperaFilmes { (listaDeFilme) in
            self.listaDeFilme = listaDeFilme
            self.collectionFilmes.reloadData()

        }
    }

    // MARK: - Métodos
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaDeFilme.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "filmeCell", for: indexPath) as! CollectionViewCell
    
        return celulaFilme
    }
    


}


