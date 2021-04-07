//
//  MovieInfoRequester.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 29/03/2021.
//
// MARK: - Importing required modules

import Alamofire

// MARK: - Entrance point to main class

class MovieInfoRequester {
	
	
	// MARK: - API Basic parameters
	
	let baseURL = "https://api.themoviedb.org/3/movie"
	let apiKey = "b9455c6f8158f3b4819771909e7a9dbc"
	
	// MARK: - Making request for corresponding movie's info
	
	func request(for movieID: Int) -> MovieInfo? {
		
		let emptyMovieInfo: MovieInfo? = nil // in case request fails we return empty object
		let urlString = "\(baseURL)/\(movieID)?api_key=\(apiKey)" // full url of the request (as a string
		
		if let url = URL(string: urlString)  {
			
			if let data = try? Data(contentsOf: url) {
				
				let decoder = JSONDecoder()
				
				if let movieInfo = try? decoder.decode(MovieInfo.self, from: data) {
					print("Sucesso ao pegar as infos do filme de id \(movieID)!")
					return movieInfo
				} else {
					print("Falha em decodificar dados: \(data) em objeto movieInfo seguindo protocolo do codable MovieInfo")
				}
			} else {
				print("Falha em armazenar url: \(url) em dados (data) para filme específico")
			}
		} else {
			print("Falha ao transformar urlString: \(urlString) em objeto URL para filme específico")
		}
		
	print("Falha ao pegar as infos do filme de id: \(movieID)")
	return emptyMovieInfo
	}
}
