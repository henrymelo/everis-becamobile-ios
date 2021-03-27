//
//  MoviesListsViewController.swift
//  ListagemFilmesBecaiOS
//
//  Created by Lucas Werner Kuipers on 27/03/2021.
//

import UIKit

class MoviesListsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	var movies = [Movie]()
	var movieRequester = MoviesRequester()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		movies = movieRequester.request()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return movies.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePosterCell", for: indexPath) as! MovieCollectionViewCell
		let movie = movies[indexPath.row]
		
		cell.movieTitleLabel.text = movie.title
		
		return cell
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
