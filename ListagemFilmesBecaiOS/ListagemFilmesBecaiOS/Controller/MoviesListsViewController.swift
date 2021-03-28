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
	
	let infiniteSize = 100000000
	
	var movies = [Movie]()
	var movieRequester = MoviesRequester()
	
	@IBOutlet weak var trendingMoviesCollectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		movies = movieRequester.request()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return infiniteSize
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePosterCell", for: indexPath) as! MovieCollectionViewCell
		let movie = movies[indexPath.row % movies.count]
		
		let posterImageBaseURL = "https://image.tmdb.org/t/p/w300/"
		let posterImageParameters = movie.posterPath
		let posterImageFullURLString = "\(posterImageBaseURL)\(posterImageParameters)"
		
		let posterImageURL = URL(string: posterImageFullURLString)
		
		cell.movieTitleLabel.text = movie.title
		cell.moviePosterImage.af_setImage(withURL: posterImageURL!)
		cell.moviePosterImage.layer.cornerRadius = 20
		cell.moviePosterImage.clipsToBounds = true
		
		return cell
	}
	
	override func viewDidAppear(_ animated: Bool) {
		let midIndexPath = IndexPath(row: infiniteSize / 2 + 1, section: 0)
		trendingMoviesCollectionView.scrollToItem(at: midIndexPath, at: .centeredHorizontally, animated: false)
	}


	
//	var movieRequester = MoviesRequester()
//
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		movies = movieRequester.request()
//	}
//
//	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return movies.count
//	}
//	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//		let movie = movies[indexPath.row]
//
//		cell.textLabel?.text = movie.title
//		cell.detailTextLabel?.text = movie.overview
//
//		return cell
//	}
}
