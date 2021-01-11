//
//  DetalhesFilmeViewController.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 08/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit

class DetalhesFilmeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tituloTextLabel: UILabel!
    @IBOutlet weak var imagemFilme: UIImageView!
    @IBOutlet weak var sinopseTextLabel: UILabel!
    @IBOutlet weak var lancamentoTextLabel: UILabel!
    
    // MARK: - Variáveis
    let filmesAPI = FilmesRequisition()
    
    var filmeSelecionado:[String:Any]? = nil
    
    var paginaAtual:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showFilme()
    }
    
    func showFilme() {
        
        guard let filme = filmeSelecionado as? [String:Any] else { return }
        guard let idFilmeSelecionado = filme["id"] as? Int else { return }
        guard let imagemFilmeSelecionado = filme["imagem"] as? UIImage else { return }
        
        filmesAPI.pegarDetalhesPelo(id: idFilmeSelecionado, pagina: paginaAtual) { (filme) in
            
            var filmeAtual = filme[0]
            guard let nome = filmeAtual["nome"]  as? String else { return }
            guard let sinopse = filmeAtual["sinopse"]  as? String else { return }
            guard let lancamento = filmeAtual["lancamento"]  as? String else { return }
            
            var lancamentoArr:[String] = lancamento.components(separatedBy: "-")
            
            var lancamentoLapidado = "\(lancamentoArr[2])/\(lancamentoArr[1])/\(lancamentoArr[0])"
            
            self.tituloTextLabel.text = nome
            self.imagemFilme.image = imagemFilmeSelecionado
            self.sinopseTextLabel.text = sinopse
            self.lancamentoTextLabel.text = lancamentoLapidado
            
        }
    }
    
    @IBAction func botaoVoltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
