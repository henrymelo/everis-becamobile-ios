//
//  DescricaoFilmeViewController.swift
//  cinesofa
//
//  Created by Fabricio Rodrigo Baixo on 1/11/21.
//  Copyright © 2021 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class DescricaoFilmeViewController: UIViewController {

    @IBOutlet weak var imagemCapaFilme: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSinopse: UILabel!
    
    @IBOutlet weak var scrollFilme: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let filme = filmeSelecionado else {return print("Erro ao buscar informações sobre o pacoteViagens(classe: DetalhesViagensViewController)")}
        
        let poster = String("https://www.themoviedb.org/t/p/w220_and_h330_face\(filme.posterPath)")
        
        print(poster)
        guard let urlPoster = URL(string: poster) else{return}

        guard let imageData = NSData(contentsOf: urlPoster ) else{return}

        print(poster)
        self.imagemCapaFilme.image = UIImage(data: imageData as Data)
//
//      self.imagemCapaFilme

        self.labelTitulo.text = filme.title
        self.labelSinopse.text = filme.overview
    }
    
    var filmeSelecionado:Result?

    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        if let voltar = self.navigationController{
            voltar.popToRootViewController(animated: true)}
    }
    
    
}
