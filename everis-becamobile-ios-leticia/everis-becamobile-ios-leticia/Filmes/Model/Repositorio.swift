//
//  Repositorio.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 08/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit

class Repositorio: NSObject {
    
    var detalhesViewController:DetalhesViewController?
    
    // Tendencia

    func recuperaTendencias(completion:@escaping(_ listaDeTendencias:Array<Tendencia>) -> Void) {
        var tendencias = TendenciaDAO().recuperaTendencia()
        if tendencias.count == 0 {
            FilmeAPI().recuperaTendenciasServidor {
                tendencias = TendenciaDAO().recuperaTendencia()
                completion(tendencias)
            }
        } else {
            completion(tendencias)
        }
    }
    
    func salvaTendencia(tendencia:Dictionary<String, Any>) {
        TendenciaDAO().salvaTendencia(dicionarioDeTendencia: tendencia)
    }
    
    // Detalhes
    
    func recuperaDetalhes(_ tendencia:Tendencia, completion:@escaping(_ listaDeDetalhes:Array<Detalhes>) -> Void) {
        var detalhes = DetalhesDAO().recuperaDetalhes()
        
            FilmeAPI().recuperaDetalhesServidor(tendencia) {
                detalhes = DetalhesDAO().recuperaDetalhes()
                completion(detalhes)
            }
    }
    
    func salvaDetalhes(detalhe:Dictionary<String, Any>) {
        DetalhesDAO().salvaDetalhes(dicionarioDeDetalhes: detalhe)
    }
}
