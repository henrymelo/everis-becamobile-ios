//
//  MovieListsViewControllerTests.swift
//  MockflixTests
//
//  Created by Lucas Werner Kuipers on 31/03/2021.
//

import XCTest
@testable import Mockflix

class MovieListsViewControllerTests: XCTestCase {
	
	func testTrendingCollectionTotalItemsCountEqualsListSize() {
		let movieListsViewController = MoviesListsViewController()
		
		guard let trendingMoviesCollectionView = movieListsViewController.trendingMoviesCollectionView else { return }
		
		let totalItemsInCollectionView = (0..<trendingMoviesCollectionView.numberOfSections).reduce(0) { res, cur in
			res + trendingMoviesCollectionView.numberOfItems(inSection: cur)
		}
		
		let trendingMoviesListCount = movieListsViewController.trendingMovies.count
		
		XCTAssertEqual(trendingMoviesListCount, totalItemsInCollectionView)
	}
	
	func testPopularCollectionTotalItemsCountEqualsListSize() {
		let movieListsViewController = MoviesListsViewController()
		
		guard let popularMoviesCollectionView = movieListsViewController.popularMoviesCollectionView else { return }
		
		let totalItemsInCollectionView = (0..<popularMoviesCollectionView.numberOfSections).reduce(0) { res, cur in
			res + popularMoviesCollectionView.numberOfItems(inSection: cur)
		}
		
		let popularMoviesListCount = movieListsViewController.popularMovies.count
		
		XCTAssertEqual(popularMoviesListCount, totalItemsInCollectionView)
	}
	
	func testTopRatedCollectionTotalItemsCountEqualsListSize() {
		let movieListsViewController = MoviesListsViewController()
		
		guard let topRatedMoviesCollectionView = movieListsViewController.latestMoviesCollectionView else { return }
		
		let totalItemsInCollectionView = (0..<topRatedMoviesCollectionView.numberOfSections).reduce(0) { res, cur in
			res + topRatedMoviesCollectionView.numberOfItems(inSection: cur)
		}
		
		let topRatedMoviesListCount = movieListsViewController.latestMovies.count
		
		XCTAssertEqual(topRatedMoviesListCount, totalItemsInCollectionView)
	}
}
