//
//  Movie.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 26/03/2021.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
	let voteAverage: Double // rating
	let title: String
	let overview: String
	let id: Int
	let posterPath: String

	enum CodingKeys: String, CodingKey {
		case voteAverage = "vote_average"
		case title
		case overview
		case id
		case posterPath = "poster_path"
	}
}
