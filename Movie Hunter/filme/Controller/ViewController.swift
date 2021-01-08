//
//  ViewController.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 07/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController/*, UICollectionViewDataSource*/ {

    


    
    //MARk: - IBOutlets

    @IBOutlet weak var CollectionFilmes: UICollectionView!
    
    // MARK: - Variáveis

    var listaFilme: Array<String>?
    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FilmeAPI().detalheFilme()
    }
    
    
    // MARK: - Métodos
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
    
}


