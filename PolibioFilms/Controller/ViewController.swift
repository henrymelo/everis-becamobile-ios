//
//  ViewController.swift
//  PolibioFilms
//
//  Created by Artur Rodrigues Fortunato on 07/01/21.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionFilmes: UICollectionView!
    
    @IBOutlet weak var imageFilme: UIImageView!
    @IBOutlet weak var tituloFilme: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionFilmes.dataSource = self
        ReceberAPI().consumindoAPI(completion: { (testes) in
            print(testes.results[0].title)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilmes = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! ListaFilmesCollectionViewCell
        celulaFilmes.backgroundColor = UIColor.blue
        return celulaFilmes
    }
    

}
