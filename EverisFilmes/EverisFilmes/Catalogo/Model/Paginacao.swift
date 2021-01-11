//
//  Paginacao.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 11/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation

class Paginacao: NSObject {
    
    var pagina: Int
    
     init(pagina: Int) {
        self.pagina = pagina
    }
    
    
    func capturaPagina() -> Int{
        
        var paginaAuxiliar = pagina
        
        var paginaSelecionada = paginaAuxiliar
        
        paginaAuxiliar = paginaSelecionada + 1
        
        return paginaSelecionada
    }
}
