//
//  FilmeS.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

class FilmeS {
    
    let title: String
    let overview: String
    let voteAverage:String
    
    let dicionarioFilmes: Dictionary<String, String> = [
        "titulo" = title,
        "sinopse" = overview,
        "rating" = voteAverage
    ]
    
}
