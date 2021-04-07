//
//  MovieDetailsViewModel.swift
//  Mockflix2
//
//  Created by Lucas Werner Kuipers on 06/04/2021.
//

// MARK: - MovieDetailsViewModel
struct MovieDetailsViewModel {
	let title: String
	let	overview: String
	let backdropPath: String
	let voteAverage: Double
	init(title: String, overview: String, backdropPath: String, voteAverage: Double) {
		self.title = title
		self.overview = overview
		self.backdropPath = backdropPath
		self.voteAverage = voteAverage
	}
}
