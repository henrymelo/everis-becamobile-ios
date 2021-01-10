//
//  DetalheFilmesViewController.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/10/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import UIKit

class DetalheFilmeViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var posterFilme: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelTituloOriginal: UILabel!
    

    
    // MARK: - Variáveis
    var filmeSelecionado:[String:Any]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mostraFilme()
    }
    
    func mostraFilme() {
        
        guard let filme = filmeSelecionado else { return }
        guard let idFilmeAtual = filme["id"] as? Int else { return }
        guard let imagemFilmeAtual = filme["poster"] as? UIImage else { return }
        
        FilmeAPI().filmeDetalhes(idFilmeAtual) { (filme) in
            
            var filmeAtual = filme[0]
            guard let tituloOriginal = filmeAtual["tituloOriginal"] as? String else { return }
            guard let titulo = filmeAtual["titulo"]  as? String else { return }
            guard let sinopse = filmeAtual["sinopse"]  as? String else { return }
            guard let rating = filmeAtual["rating"] as? Double else { return }
 
            self.labelTituloOriginal.text = "'\(tituloOriginal)'"
            self.labelTitulo.text = titulo
            self.posterFilme.image = imagemFilmeAtual
            self.labelSinopse.text = sinopse
            self.labelRating.text = "Nota: \(rating)"
        }
        self.posterFilme.layer.cornerRadius = 10
        self.posterFilme.layer.masksToBounds = true
    }
    
    @IBAction func buttonSair(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
