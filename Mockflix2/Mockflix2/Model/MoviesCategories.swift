//
//  MoviesCategories.swift
//  Mockflix2
//
//  Created by Lucas Werner Kuipers on 06/04/2021.
//

import Foundation

enum MoviesCategories: String {
	case TrendingDay
	case TrendingWeek
	case Popular
	case TopRated
	var url: String {
		switch self {
		case .TrendingDay: return "trending/movie/day"
		case .TrendingWeek: return "trending/movie/week"
		case .Popular: return "popular/movie"
		case .TopRated: return "top_rated/movie"
		}
	}
}
