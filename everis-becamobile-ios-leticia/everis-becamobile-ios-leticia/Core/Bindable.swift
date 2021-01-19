//
//  Bindable.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 13/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
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
