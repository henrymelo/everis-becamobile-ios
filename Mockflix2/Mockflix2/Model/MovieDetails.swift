//
//  MovieDetails.swift
//  Mockflix2
//
//  Created by Lucas Werner Kuipers on 06/04/2021.
//

import Foundation

// MARK: - MovieDetails
struct MovieDetails: Codable {
	let originalTitle, overview: String
	let voteAverage: Double
	let backdropPath: String?

	enum CodingKeys: String, CodingKey {
		case backdropPath = "backdrop_path"
		case originalTitle = "original_title"
		case overview
		case voteAverage = "vote_average"
	}
}
