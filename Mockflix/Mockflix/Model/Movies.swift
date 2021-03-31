//
//  Movies.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 26/03/2021.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
	let page: Int
	let results: [Movie]
	
	enum CodingKeys: String, CodingKey {
		case page
		case results
	}
}
