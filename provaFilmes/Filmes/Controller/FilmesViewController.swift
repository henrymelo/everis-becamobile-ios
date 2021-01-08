//
//  FilmesViewController.swift
//  provaFilmes
//
//  Created by Aloisio Formento Junior on 07/01/21.
//  Copyright © 2021 Aloisio Formento Junior. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FilmesViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var colecaoFilmes: UICollectionView!

    
    var filmes: [Filmes] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.dataSource = self
        getFilme()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilmes = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! celulaFilmeCollectionViewCell
        let imageUrl = URL(string: "http://image.tmdb.org/t/p/w300\(filmes[indexPath.row].posterPath)")
        celulaFilmes.imagemFilme.af_setImage(withURL: imageUrl!)
        celulaFilmes.layer.cornerRadius = 10
        print(filmes[indexPath.row].mediaType)
        return celulaFilmes
    }
    
    func getFilme() {
        FilmesAPI().getFilmes { (filmesArray, erro) in
            if let error = erro {
                print(error)
            }else if let filmes = filmesArray{
                self.filmes=filmes
                self.colecaoFilmes.reloadData()
                

            }
        }
        
    }

}
