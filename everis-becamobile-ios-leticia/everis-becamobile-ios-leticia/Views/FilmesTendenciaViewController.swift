//
//  FilmesTendenciaViewController.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 11/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import CoreData

class FilmesTendenciaViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {
    
    @IBOutlet weak var colecaoFilmesTendencia: UICollectionView!
    
    // MARK: - Atributos
    
    var tendencias:Array<Tendencia> = []
    var detalhesViewController:DetalhesViewController?
    var tendenciaSelecionada:Tendencia?
    
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmesTendencia.dataSource = self
        colecaoFilmesTendencia.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FilmeViewModel().limpaCoreDataTendencia()
        
        FilmeViewModel().recuperaTendencias { (listaDeTendencias) in
            self.tendencias = listaDeTendencias
            self.colecaoFilmesTendencia.reloadData()
        }
    }
    
    
    // MARK: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tendencias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilmes", for: indexPath) as! TendenciaCollectionViewCell
        
        let tendenciaAtual = tendencias[indexPath.item]
        
        celulaFilme.configuraCelula(tendenciaAtual)
        return celulaFilme

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-5, height: 223) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selecionada = tendencias[indexPath.row]
        tendenciaSelecionada = selecionada
        performSegue(withIdentifier: "detalhes", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detalhes", let detalhesViewController = segue.destination as? DetalhesViewController else { return }
        detalhesViewController.tendencia = tendenciaSelecionada
    }
    

}
