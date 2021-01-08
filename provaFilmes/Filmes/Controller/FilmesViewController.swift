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

class FilmesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var colecaoFilmes: UICollectionView!
    


    
    var filmes: [Filmes] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self
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
        return celulaFilmes
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detalhesFilme = filmes[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesFilme") as! DetalhesFilmeViewController
        controller.filmeSelecionado = detalhesFilme
        navigationController?.pushViewController(controller, animated: true)
//        self.present(controller, animated: true, completion: nil)
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width: larguraCelula - 20, height: 160)
    }

}
