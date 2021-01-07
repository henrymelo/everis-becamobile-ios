//
//  ViewController.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 07/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionFilmes: UICollectionView!
    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FilmeAPI().recuperaFilmes()
        
        }
    
    
    // MARK: -

    
    }


