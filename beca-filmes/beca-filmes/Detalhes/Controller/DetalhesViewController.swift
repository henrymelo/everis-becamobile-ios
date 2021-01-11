//
//  DetalhesViewController.swift
//  beca-filmes
//
//  Created by Gabriel Santos Souza on 11/01/21.
//  Copyright © 2021 Gabriel Santos Souza. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    @IBOutlet weak var imageFilme: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSinopse: UILabel!
    @IBOutlet weak var labelNota: UILabel!
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
