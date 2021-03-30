//
//  MoviesListsViewController.swift
//  ListagemFilmesBecaiOS
//
//  Created by Lucas Werner Kuipers on 27/03/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class MoviesListsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	var selectedMovieID = -1
	
	let infiniteSize = 100000000
	
	var trendingMovies = [Movie]()
	var movieRequester = MoviesRequester()
	
	var firstLoad = true
		
	@IBOutlet weak var trendingMoviesCollectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		trendingMovies = movieRequester.request()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return infiniteSize
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePosterCell", for: indexPath) as! MovieCollectionViewCell
		
		if trendingMovies.count <= 0 { return cell }
		
		let movie = trendingMovies[indexPath.row % trendingMovies.count]

		// MARK: - Setting up movie title
		
		cell.movieTitleLabel.text = movie.title
		

		// MARK: - Setting up movie poster
		
		let posterImageBaseURL = "https://image.tmdb.org/t/p/w300/"
		let posterImageParameters = movie.posterPath
		let posterImageFullURLString = "\(posterImageBaseURL)\(posterImageParameters)"
		let posterImageURL = URL(string: posterImageFullURLString)
		
		cell.moviePosterImage.af_setImage(withURL: posterImageURL!)
		cell.moviePosterImage.layer.cornerRadius = 20
		cell.moviePosterImage.clipsToBounds = true
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		selectedMovieID = trendingMovies[indexPath.row % trendingMovies.count].id
	}
	
	override func viewDidAppear(_ animated: Bool) {
		let midIndexPath = IndexPath(row: infiniteSize / 2 + 1, section: 0)
		
		if firstLoad {
			trendingMoviesCollectionView.scrollToItem(at: midIndexPath, at: .centeredHorizontally, animated: false)
			firstLoad = false
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let viewController = segue.destination as? MovieDetailsViewController {
			viewController.movieListViewController = self
		}
	}
}

