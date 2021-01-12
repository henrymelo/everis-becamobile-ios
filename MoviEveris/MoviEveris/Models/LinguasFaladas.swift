//
//  LinguasFaladas.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/7/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

class LinguasFaladas: NSObject, Decodable {
    
    var englishName: String?
    var iso639_1: String?
    var name: String?
    
    init(_ englishName: String?, _ iso639_1: String?, _ name: String?) {
        self.englishName = englishName
        self.iso639_1 = iso639_1
        self.name = name
    }
}
