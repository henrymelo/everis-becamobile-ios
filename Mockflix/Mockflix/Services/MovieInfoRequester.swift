//
//  MovieInfoRequester.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 29/03/2021.
//

import Alamofire

class MovieInfoRequester {
	
	let baseURL = "https://api.themoviedb.org/3/movie"
	let apiKey = "b9455c6f8158f3b4819771909e7a9dbc"
	
	
	func request(for movieID: Int) -> MovieInfo? {
		
		let emptyMovieInfo: MovieInfo? = nil
		
		let urlString = "\(baseURL)/\(movieID)?api_key=\(apiKey)"
		
		if let url = URL(string: urlString)  {
			if let data = try? Data(contentsOf: url) {
				
				let decoder = JSONDecoder()
				
				if let movieInfo = try? decoder.decode(MovieInfo.self, from: data) {
					print("Sucesso ao pegar as infos do filme de id \(movieID)!")
					print(movieInfo)
					return movieInfo
				}
			}
		}
	print("Falha ao pegar as infos do filme de id: \(movieID)")
	return emptyMovieInfo
	}
}
