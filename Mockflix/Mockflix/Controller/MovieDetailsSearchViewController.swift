//
//  MovieDetailsSearchViewController.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 31/03/2021.
//
// MARK: - Importing required modules

import UIKit

// MARK: - Entrance point to main class

class MovieDetailsSearchViewController: UIViewController, UINavigationControllerDelegate {
	
	// MARK: - IBOutlets
	
//	@IBOutlet weak var movieBackdropImage: UIImageView!
//	@IBOutlet weak var movieTitle: UILabel!
//	@IBOutlet weak var movieRating: UILabel!
//	@IBOutlet weak var movieOverview: UILabel!
	
	@IBOutlet weak var movieBackdropImage: UIImageView!
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var movieRating: UILabel!
	@IBOutlet weak var movieOverview: UILabel!
	
	
	// MARK: - Global variables and constants
	var movieInfoRequester = MovieInfoRequester() // Object with method to retrieve movie's info from API
	var searchBarViewController: SearchMovieViewController?

	// MARK: - Life Cycle Methods
	
	// Loaded view
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		 Allows swipe-right to dismiss details view
		let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
		if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
		  let gestureRecognizer = UIPanGestureRecognizer()
		  gestureRecognizer.setValue(targets, forKey: "targets")
		  self.view.addGestureRecognizer(gestureRecognizer)
		}
		
		print(searchBarViewController!.selectedMovieID)
//		 Retrieving selected movie's id that was clicked from main view
		guard let selectedMovieID = searchBarViewController?.selectedMovieID else { return }
		
		// Getting info for movie with corresponding id
		guard let selectedMovieInfo = movieInfoRequester.request(for: selectedMovieID) else { return }
		
		// Displaying corresponding text info on screen (on outlets)
		movieTitle.text = selectedMovieInfo.originalTitle
		movieRating.text = "\(Int(selectedMovieInfo.voteAverage * 10))%"
		movieOverview.text = selectedMovieInfo.overview
		
		
		// Displaing corresponding movie's backdrop image on screen
		let backdropImageBaseURL = "https://image.tmdb.org/t/p/original/"
		guard let backdropImageParameters = selectedMovieInfo.backdropPath else { return }
		let backdropImageFullURLString = "\(backdropImageBaseURL)\(backdropImageParameters)"
		let backdropImageURL = URL(string: backdropImageFullURLString)
		
		movieBackdropImage.af_setImage(withURL: backdropImageURL!)
		
	}
}
