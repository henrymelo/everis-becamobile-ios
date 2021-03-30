//
//  MovieDetailsViewController.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 29/03/2021.
//

import UIKit

class MovieDetailsViewController: UIViewController, UINavigationControllerDelegate {
	
	
	@IBOutlet weak var movieBackdropImage: UIImageView!
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var movieRating: UILabel!
	@IBOutlet weak var movieOverview: UILabel!
	
	var movieInfoRequester = MovieInfoRequester()
	
	
	var movieListViewController: MoviesListsViewController?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Allows swipe-right to dismiss details view
		let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
		if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
		  let gestureRecognizer = UIPanGestureRecognizer()
		  gestureRecognizer.setValue(targets, forKey: "targets")
		  self.view.addGestureRecognizer(gestureRecognizer)
		}
		guard let selectedMovieID = movieListViewController?.selectedMovieID else { return }
		
		// Getting info
		guard let selectedMovieInfo = movieInfoRequester.request(for: selectedMovieID) else { return }
		
		// Showing info
		movieTitle.text = selectedMovieInfo.originalTitle
		movieRating.text = "\(Int(selectedMovieInfo.voteAverage * 10))%"
		movieOverview.text = selectedMovieInfo.overview
		
		
		// Setting up movie backdrop image
		
		let backdropImageBaseURL = "https://image.tmdb.org/t/p/w500/"
		let backdropImageParameters = selectedMovieInfo.backdropPath
		let backdropImageFullURLString = "\(backdropImageBaseURL)\(backdropImageParameters)"
		let backdropImageURL = URL(string: backdropImageFullURLString)
		
		movieBackdropImage.af_setImage(withURL: backdropImageURL!)
		
    }
}
