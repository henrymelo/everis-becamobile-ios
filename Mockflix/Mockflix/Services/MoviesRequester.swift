//
//  API.swift
//  ListagemFilmesBecaiOS
//
//  Created by Lucas Werner Kuipers on 27/03/2021.
//

import Alamofire

class MoviesRequester {
	

	let baseURL = "https://api.themoviedb.org/3/trending/movie/day?"
	let apiKey = "b9455c6f8158f3b4819771909e7a9dbc"

	var urlString: String {
		return "\(baseURL)api_key=\(apiKey)"
	}
	
	func request() -> [Movie] {
		if let url = URL(string: urlString)  {
			if let data = try? Data(contentsOf: url) {
				
				let decoder = JSONDecoder()
				var movies: [Movie] = []
				
				if let jsonMovies = try? decoder.decode(Movies.self, from: data) {
					movies = jsonMovies.results
					print("Sucesso ao pegar os dados!")
					return movies
				} else { print("problema 1")}
			} else { print("problema 2")}
		} else { print("problema 3")}
	print("Falha ao pegar os resultados")
	return []
	}
}
