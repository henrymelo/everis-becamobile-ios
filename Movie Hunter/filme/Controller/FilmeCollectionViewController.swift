//
//  FilmeCollectionViewController.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 07/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FilmeCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var CollectionFilme: UICollectionView!
    @IBOutlet weak var CelulaFilme: UICollectionViewCell!
    @IBOutlet weak var PosterFilme: UIImageView!
    @IBOutlet weak var LabelFilme: UILabel!
    
    
    //MARK: Variáveis
    
    let listaComTodosFilmes:Array<ListaFilmes> = FilmeDAO().recuperaTodosFilmes()
    var listaFilmes:Array<ListaFilmes> = []
    

    
    // MARK : - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        listaFilmes = listaComTodosFilmes
    }

    // MARK : - Métodos
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilmes", for: indexPath) as! UICollectionViewCell
        let filmeAtual = listaFilmes[indexPath.item]
        return celulaFilme
        
        
    }

}
