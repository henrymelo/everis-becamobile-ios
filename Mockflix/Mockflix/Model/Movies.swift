//
//  Movies.swift
//  ListagemFilmesBecaiOS
//
//  Created by Lucas Werner Kuipers on 26/03/2021.
//

import Foundation

// MARK: - MovieList
struct Movies: Codable {
	let page: Int
	let results: [Movie]
	let totalPages, totalResults: Int

	enum CodingKeys: String, CodingKey {
		case page, results
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}
}
