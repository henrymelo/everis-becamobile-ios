//
//  HomeViewController.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/12/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var colecaoFilmes: UICollectionView!

    
    var listaFilmes:[FilmeSimples] = []
    var posterPath: String = ""
    var paginaAtual = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self
        MovieService().getFilmesPopulares(self.paginaAtual) { (listaFilmes) in
            self.listaFilmes = listaFilmes
            self.colecaoFilmes.reloadData()
        } failure: { (error) in
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // método que coloca dados de poster e titulo nas células de filmes na primeira página
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
        
        let filmeAtual = listaFilmes[indexPath.item]
        
        guard let posterUrl = filmeAtual.backdropPath else { return celulaFilme }
        MovieService().getPosterFilme(posterUrl) { (imagem) in
            celulaFilme.posterFilme.image = imagem
        }
        guard let titulo = filmeAtual.title else { return celulaFilme }
        
        
        celulaFilme.labelTitulo.text = titulo
        celulaFilme.configuraCelula(filmeAtual)
        
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filme = listaFilmes[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetailMovieViewController
        
        controller.filmeSelecionado = filme
        controller.paginaAtual = self.paginaAtual
        
        self.present(controller, animated: true, completion: nil)
        
    }
    
    // MARK: - Métodos
    
//    func recuperaPosteres() {
//        //  Mostra os posteres dos filmes
//        MovieService().getPosterFilme(self.posterPath) { (<#Image#>) in
//            <#code#>
//        }
//
//    }

    @IBAction func paginaAnterior(_ sender: UIButton) {
        if self.paginaAtual > 1 {
            self.paginaAtual = self.paginaAtual - 1
            MovieService().getFilmesPopulares(self.paginaAtual) { (filmes) in
                let listaFilmesAtual = filmes
                self.listaFilmes = listaFilmesAtual
                self.colecaoFilmes.reloadData()
            } failure: { (error) in
                print(error)
            }
        }
    }
    @IBAction func proximaPagina(_ sender: UIButton) {
        self.paginaAtual = self.paginaAtual + 1
        MovieService().getFilmesPopulares(self.paginaAtual) { (filmes) in
            let listaFilmesAtual = filmes
            self.listaFilmes = listaFilmesAtual
            self.colecaoFilmes.reloadData()
        } failure: { (error) in
            print(error)
        }
    }

}
//extension HomeViewController: MainViewModelDelegate {
//    
//    func reloadData(movie: MovieViewData) {
//        movie.filmes.count
//    }
//}
