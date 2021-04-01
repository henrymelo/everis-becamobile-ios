//
//  Bindable.swift
//  MoviEveris
//
//  Created by Mathias Almeida Nonohay on 1/12/21.
//  Copyright © 2021 Mathias Almeida Nonohay. All rights reserved.
//

import Foundation

public class Bindable<T> {
    
    typealias Listener = (T) -> Void
    
    // MARK: - Properties
    var listeners: [Listener] = []
    
    // MARK: - Constructors
    init(_ v: T) {
        self.value = v
    }
    
    // MARK: - Bind
    func bind(_ listerner: @escaping Listener) {
        self.listeners.append(listerner)
    }
    
    var value: T {
        didSet {
            listeners.forEach { $0(value) }
        }
    }
}
