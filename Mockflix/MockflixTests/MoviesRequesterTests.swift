//
//  MoviesRequesterTests.swift
//  MockflixTests
//
//  Created by Lucas Werner Kuipers on 31/03/2021.
//

import XCTest
@testable import Mockflix


class MoviesRequesterTests: XCTestCase {

	// MARK: - Checking if response is not nil
	func testRequestResponseCategoryTrendingNotNil() {
		let moviesRequester = MoviesRequester()
		let category = "trending/movie/day"
		let result = moviesRequester.request(forCategory: category)
		
		XCTAssertNotNil(result)
	}
	
	func testRequestResponseCategoryPopularNotNil() {
		let moviesRequester = MoviesRequester()
		let category = "movie/popular"
		let result = moviesRequester.request(forCategory: category)

		XCTAssertNotNil(result)
	}
	
	func testRequestResponseCategoryTopRatedNotNil() {
		let moviesRequester = MoviesRequester()
		let category = "movie/top_rated"
		let result = moviesRequester.request(forCategory: category)
		
		XCTAssertNotNil(result)
		
	}
	
	// MARK: - Checking if response is of type [Movie]
	func testRequestResponseCategoryTrendingIsOfTypeListOfMovie() {
		let moviesRequester = MoviesRequester()
		let category = "trending/movie/day"
		let result = moviesRequester.request(forCategory: category)
		let results : [Any] = result
		
		var resultIsListOfMovieObjects = true
		
		for obj in results {
			if obj as? Movie == nil {
				resultIsListOfMovieObjects = false
			}
		}
		
		XCTAssertTrue(resultIsListOfMovieObjects)
	}
	
	func testRequestResponseCategoryPopularIsOfTypeListOfMovie() {
		let moviesRequester = MoviesRequester()
		let category = "movie/popular"
		let result = moviesRequester.request(forCategory: category)
		let results : [Any] = result
		
		var resultIsListOfMovieObjects = true
		
		for obj in results {
			if obj as? Movie == nil {
				resultIsListOfMovieObjects = false
			}
		}
		
		XCTAssertTrue(resultIsListOfMovieObjects)
	}
	
	func testRequestResponseCategoryTopRatedIsOfTypeListOfMovie() {
		let moviesRequester = MoviesRequester()
		let category = "movie/top_rated"
		let result = moviesRequester.request(forCategory: category)
		let results : [Any] = result
		
		var resultIsListOfMovieObjects = true
		
		for obj in results {
			if obj as? Movie == nil {
				resultIsListOfMovieObjects = false
			}
		}
		
		XCTAssertTrue(resultIsListOfMovieObjects)
	}
	
	
	
	//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
	
	

}
