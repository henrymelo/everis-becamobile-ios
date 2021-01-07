//
//  FilmesViewController.swift
//  provaFilmes
//
//  Created by Aloisio Formento Junior on 07/01/21.
//  Copyright © 2021 Aloisio Formento Junior. All rights reserved.
//

import UIKit
import Alamofire

class FilmesViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.dataSource = self
        FilmesAPI().getFilmes()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilmes = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! celulaFilmeCollectionViewCell
        celulaFilmes.backgroundColor = UIColor.blue
        
        return celulaFilmes
    }

}
