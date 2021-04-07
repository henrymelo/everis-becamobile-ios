//
//  MovieViewModel.swift
//  Mockflix2
//
//  Created by Lucas Werner Kuipers on 06/04/2021.
//

// MARK: - Movie View Model
struct MovieViewModel {
	let voteAverage: Double // rating
	let title: String
	let overview: String
	let id: Int
	let posterPath: String
	init(voteAverage: Double, title: String, overview: String, id: Int, posterPath: String) {
		self.voteAverage = voteAverage
		self.title = title
		self.overview = overview
		self.id = id
		self.posterPath = posterPath
	}
}
