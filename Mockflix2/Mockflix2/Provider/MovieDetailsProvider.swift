//
//  MovieDetailsProvider.swift
//  Mockflix2
//
//  Created by Lucas Werner Kuipers on 06/04/2021.
//

import Alamofire

class MovieDetailsProvider {
	func requestDetails(for movieID: Int) -> MovieDetails? {
		let emptyMovieDetails: MovieDetails? = nil
		let urlString = "\(API.baseURL)/\(movieID)?api_key=\(API.key)"
		if let url = URL(string: urlString) {
			print("✅ Success on converting urlString to URL")
			if let data = try? Data(contentsOf: url) {
				let decoder = JSONDecoder()
				if let movieInfo = try? decoder.decode(MovieDetails.self, from: data) {
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
	return emptyMovieDetails
	}
}
