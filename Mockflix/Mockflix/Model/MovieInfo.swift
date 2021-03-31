//
//  MovieInfo.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 29/03/2021.
//

import Foundation

// MARK: - MovieInfo
struct MovieInfo: Codable {
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
