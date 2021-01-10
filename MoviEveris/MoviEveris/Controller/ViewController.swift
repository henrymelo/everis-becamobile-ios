//
//  ViewController.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    @IBOutlet weak var labelTituloView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.dataSource = self
        
    }
    func fazAlgo(){
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
        return celulaFilme
    }
}


