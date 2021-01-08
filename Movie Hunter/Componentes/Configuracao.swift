//
//  Configuracao.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 08/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit

class Configuracao: NSObject {
    
    func getKeyPadrao() -> String? {
        
        guard let caminhoParaPlist = Bundle.main.path(forResource: "Info", ofType: "plist") else { return nil }
        guard let dicionario = NSDictionary(contentsOfFile: caminhoParaPlist) else { return nil }
        guard let keyPadrao = dicionario["KeyPadrao"] as? String else { return nil }
        
        return keyPadrao
    }

}
