//
//  MoviePosterViewModel.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 04/04/2021.
//

import Foundation

// MARK: - MoviePosterViewModel
struct MovieViewModel {

	let id: Int
	let posterPath: String?
	
	// Dependency Injection (DI)
	init(movie: Movie) {
		self.id = movie.id
		if let posterPath = movie.posterPath {
			self.posterPath = posterPath
		} else {
			self.posterPath = ""
		}
	}
	
}
