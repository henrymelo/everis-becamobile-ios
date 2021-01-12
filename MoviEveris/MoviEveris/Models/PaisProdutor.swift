//
//  PaisProdutor.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

class PaisProdutor: NSObject, Decodable {
    
    var iso3166_1: String?
    var name: String?
    
    init(_ iso3166_1: String?, _ name: String?) {
        self.iso3166_1 = iso3166_1
        self.name = name
    }
    
}
