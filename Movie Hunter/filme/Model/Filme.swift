//
//  Filme.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 07/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit

class Filme: NSObject {
   
    let nomeDoFilme: String
    let descricao: String
    let dataLancamento: String
    let poster: UIImage
    
    init(nomeDoFilme: String, descricao: String, dataLancamento: String, poster:UIImage) {
        self.nomeDoFilme = nomeDoFilme
        self.descricao = descricao
        self.dataLancamento = dataLancamento
        self.poster = poster
        
        
    }

}
