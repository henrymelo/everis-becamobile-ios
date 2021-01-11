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

    var listaFilme: Array<Filme> = []
    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionFilmes.dataSource = self
        collectionFilmes.delegate = self
        FilmeAPI().detalheFilme()
    }
    
    
    // MARK: - Métodos
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaFilme.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "filmeCell", for: indexPath) as! CollectionViewCell
        
        let filmeAtual = listaFilme[indexPath.row]
        celulaFilme.configuraCelula(filme: filmeAtual)
        
        collectionFilmes.reloadData()
        
        return celulaFilme
    }
    


}


