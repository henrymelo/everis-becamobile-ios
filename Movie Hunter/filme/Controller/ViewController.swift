//
//  ViewController.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 07/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate {

    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionFilmes: UICollectionView!
    
    // MARK: - Variavies
    let listaComTodosFilmes:Array<ListaFilmes> = FilmeDAO().recuperaTodosFilmes()
    var listaFilmes:Array<ListaFilmes> = []

    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaFilmes = listaComTodosFilmes
    }
    
    
    // MARK: - Métodos
    

    
}


