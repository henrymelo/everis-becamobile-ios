//
//  Filmes.swift
//  cinesofa
//
//  Created by Fabricio Rodrigo Baixo on 1/7/21.
//  Copyright © 2021 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class Filmes: NSObject {
    
    let titulo:String
    let urlImagem:String
    
    init(titulo:String,imagem:String) {
        self.titulo = titulo
        self.urlImagem = imagem
    }
}
