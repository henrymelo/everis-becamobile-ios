//
//  Movie.swift
//  ListagemFilmesBecaiOS
//
//  Created by Lucas Werner Kuipers on 26/03/2021.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
//	let video: Bool
//	let voteAverage: Double
	let title: String
//	let name: String?
//	let voteCount: Int
	let overview: String
	let adult: Bool
//	let backdropPath: String
//	let id: Int
//	let genreIDS: [Int]
//	let releaseDate: String
//	let originalLanguage: OriginalLanguage
//	let originalTitle, posterPath: String
//	let popularity: Double
//	let mediaType: MediaType

	enum CodingKeys: String, CodingKey {
//		case video
//		case voteAverage = "vote_average"
		case title
//		case name
//		case voteCount = "vote_count"
		case overview, adult
//		case backdropPath = "backdrop_path"
//		case id
//		case genreIDS = "genre_ids"
//		case releaseDate = "release_date"
//		case originalLanguage = "original_language"
//		case originalTitle = "original_title"
//		case posterPath = "poster_path"
//		case popularity
//		case mediaType = "media_type"
	}
}
//
enum MediaType: String, Codable {
	case movie = "movie"
}
//
//enum OriginalLanguage: String, Codable {
//	case en = "en"
//	case it = "it"
//	case ru = "ru"
//}
