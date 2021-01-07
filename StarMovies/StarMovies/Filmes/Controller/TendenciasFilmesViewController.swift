//
//  TendenciasFilmesViewController.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit
import AlamofireImage

class TendenciasFilmesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    //MARK: - Variaveis
    
    var listaTendenciaFilmes:Array<Dictionary<String, Any>> = []
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colecaoFilmes.dataSource = self
        self.colecaoFilmes.delegate = self
        
        FilmeAPI().pegarListaTendenciasFilmes { (resposta) in
            self.listaTendenciaFilmes = resposta
            self.colecaoFilmes.reloadData()
        }
        
        FilmeAPI().pegarDetalhesFilme(codFilme: 464052) { (resposta) in
            //print(resposta["title"])
        }

    }
    
    //MARK: - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaTendenciaFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let filme = Filme(listaTendenciaFilmes[indexPath.row])
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
        

        celula.labelTituloFilme.text = filme.titulo

        if let urlImagem = FilmeAPI().gerarURLImagem(link: filme.caminhoImagemPoster) {
            celula.imageFilme.af_setImage(withURL: urlImagem)
        }
        
        //Aplica sombra na imagem da celula
        celula.imageFilme.layer.shadowColor = UIColor.black.cgColor
        celula.imageFilme.layer.shadowOpacity = 1
        celula.imageFilme.layer.shadowOffset = .zero
        celula.imageFilme.layer.shadowRadius = 10
        
        return celula
    }
    
    //MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filmeDicionario = listaTendenciaFilmes[indexPath.item]
        guard let codigoFilme = filmeDicionario["id"] as? Int else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesFilme") as! DetalhesFilmeViewController
        
        FilmeAPI().pegarDetalhesFilme(codFilme: codigoFilme, completion: { (resposta) in
            let filmeDetalhado = Filme(resposta)
            controller.filmeSelecionado = filmeDetalhado
            self.navigationController?.pushViewController(controller, animated: true)
        })
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
