//
//  TendenciasFilmesViewController.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit
import AlamofireImage

class TendenciasFilmesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  , UICollectionViewDelegateFlowLayout{
    
    //MARK: - Outlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    
    
    //MARK: - Variaveis
    
    var listaTendenciaFilmes:Array<Dictionary<String, Any>> = []
    
    var paginaAtual = 1
    
    var buttonAnterior:UIButton?
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colecaoFilmes.dataSource = self
        self.colecaoFilmes.delegate = self
        
        pegarTendencias()

    }
    
    
    func pegarTendencias(){
        FilmeAPI().pegarListaTendenciasFilmes(pagina: paginaAtual) { (resposta) in
            self.listaTendenciaFilmes = resposta
            self.colecaoFilmes.reloadData()
        }
    }
    
    //MARK: - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaTendenciaFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
        
        celula.configurarCelula(Filme(listaTendenciaFilmes[indexPath.row]))
        celula.aplicarSombrar()
    
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = view.frame.size.height
        let width = view.frame.size.width
        
        let dimensaoDaTela = Int(height/width)

        if dimensaoDaTela < 2 {
        return CGSize(width: width * 0.43, height: height * 0.43)
        }else{
        return CGSize(width: width * 0.43, height: height * 0.37)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionReusableView", for: indexPath) as! FilmesFooterCollectionReusableView
            
            self.buttonAnterior = view.buttonAnterior
            
            if paginaAtual == 1 {
            self.buttonAnterior?.isHidden = true
            }
            
            return view
        }
        fatalError("Unexpected kind")
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
    
    @IBAction func buttonIrParaAnterior(_ sender: UIButton) {
        paginaAtual = paginaAtual - 1
        pegarTendencias()
        colecaoFilmes.setContentOffset(CGPoint(x:0,y:0), animated: true)
        
        if paginaAtual == 1 {
            buttonAnterior?.isHidden = true
        }
        
    }
    
    
    @IBAction func buttonProximo(_ sender: UIButton) {
        
        paginaAtual = paginaAtual + 1
        pegarTendencias()
        colecaoFilmes.setContentOffset(CGPoint(x:0,y:0), animated: true)
        
        buttonAnterior?.isHidden = false
        
    }
    

}
