//
//  DetalhesViewController.swift
//  app-filmes
//
//  Created by Gabriel Santos Souza on 19/01/21.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    @IBOutlet weak var imageFilme: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var labelNota: UILabel!
    @IBOutlet weak var scrollSinopse: UIScrollView!
    
    var filmeSelecionado: Filmes? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let filme = filmeSelecionado {
            
            labelTitulo.text = filme.titulo
            labelSinopse.text = filme.sinopse
            labelNota.text = filme.nota
            
            guard let urlCapa = FilmesAPI().buscaURLImagem(link: filme.caminhoDaCapa) else { return }
            self.imageFilme.af_setImage(withURL: urlCapa)
        }
    }
    
    @IBAction func buttonVoltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
