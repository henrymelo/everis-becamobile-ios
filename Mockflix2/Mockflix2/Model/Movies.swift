//
//  Movies.swift
//  Mockflix2
//
//  Created by Lucas Werner Kuipers on 06/04/2021.
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
