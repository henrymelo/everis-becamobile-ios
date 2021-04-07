//
//  MoviesProvider.swift
//  Mockflix2
//
//  Created by Lucas Werner Kuipers on 06/04/2021.
//

import Alamofire

class MoviesProvider {
//	static let sharedInstance = Singleton()
//	class Singleton {
//	   static let sharedInstance: Singleton = {
//		  let instance = Singleton()
//		  // setup code
//		  return instance
//	   }()
//	}
	enum MoviesCategories: String {
		case TrendingDay
		case TrendingWeek
		case Popular
		case TopRated
		case Upcoming
		var url: String {
			switch self {
			case .TrendingDay: return "trending/movie/day"
			case .TrendingWeek: return "trending/movie/week"
			case .Popular: return "movie/popular"
			case .TopRated: return "movie/top_rated"
			case .Upcoming: return "movie/upcoming"
			}
		}
	}
	static func requestMoviesList(category: MoviesCategories) -> [Movie] {
		print(category.url)

		print("-- Initiating request for movies list --")

		let movies = [Movie]()
		let urlString = "\(API.baseURL)/\(category.url)?api_key=\(API.key)"
		if let url = URL(string: urlString) {
			print("✅ Success on converting urlString to URL")

			if let data = try? Data(contentsOf: url) {
				print("✅ Success on getting data from url")
				print("URL: \(url)")

				let decoder = JSONDecoder()
				if let jsonMovies = try? decoder.decode(Movies.self, from: data) {
					print("✅ Success on decoding json data based on Movies.self")
					let movies: [Movie] = jsonMovies.results
					print("Movies list has been returned with a total of # \(movies.count) # movies")
					print(movies)
					return movies
				} else {
					print("❌ Failed decoding json data based on Movies.self")
					print("data: \(data)")
				}
			} else {
				print("❌ Failed getting data from url")
				print("url: \(url)")
			}
		} else {
			print("❌ Failed converting urlString to URL")
			print("urlString: \(urlString)")
		}
		print("-- Finished request for movies list --")
		return movies
	}
}
