//
//  MovieInfoRequester.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 27/03/2021.
//
// MARK: - Importing required modules

import Alamofire

// MARK: - Entrance point to main class

class MoviesRequester {
	
	// MARK: - API Basic parameters
	
	let baseURL = "https://api.themoviedb.org/3"
	let apiKey = "b9455c6f8158f3b4819771909e7a9dbc"

	// MARK: - Making request for list of movies
	
	func request(forCategory category: String) -> [Movie] {
		
		let urlString = "\(baseURL)/\(category)?api_key=\(apiKey)" // full url of the request (as a string)
		
		if let url = URL(string: urlString)  {
			
			if let data = try? Data(contentsOf: url) {
				let decoder = JSONDecoder()
				
				if let jsonMovies = try? decoder.decode(Movies.self, from: data) {
					let movies: [Movie] = jsonMovies.results
					print("Sucesso ao pegar lista de filmes!")
					return movies
				} else {
					print("Falha em decodificar dados: \(data) em objeto Movies seguindo protocolo do codable MovieInfo")
				}
			} else {
				print("Falha em armazenar url: \(url) em dados (data) para lista de filmes")
			}
		} else {
			print("Falha ao transformar urlString: \(urlString) em objeto URL para lista de filmes")
		}
		
	print("Falha ao pegar a lista de filmes pela API! :(")
	return []
	}
}
