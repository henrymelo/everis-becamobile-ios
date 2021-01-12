//
//  EmpresaProdutora.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

class EmpresaProdutora: NSObject, Decodable {
    
    var id: Int?
    var logoPath: String?
    var name: String?
    var originCountry: String?
    
    init(_ id: Int?, _ logoPath: String?, _ name: String?, _ originCountry: String?) {
        self.id = id
        self.logoPath = logoPath
        self.name = name
        self.originCountry = originCountry
    }
}
