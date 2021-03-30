//
//  Movies.swift
//  ListagemFilmesBecaiOS
//
//  Created by Lucas Werner Kuipers on 26/03/2021.
//

import Foundation

// MARK: - MovieList
struct Movies: Codable {
	let results: [Movie]
	
	enum CodingKeys: String, CodingKey {
		case results
	}
}
