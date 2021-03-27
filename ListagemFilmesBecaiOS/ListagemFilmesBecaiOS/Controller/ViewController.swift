//
//  ViewController.swift
//  ListagemFilmesBecaiOS
//
//  Created by Lucas Werner Kuipers on 26/03/2021.
//

import UIKit

class ViewController: UITableViewController {
	
	var movieRequester = MoviesRequester()
	
	var movies = [Movie]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		movies = movieRequester.request()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let movie = movies[indexPath.row]
		
		cell.textLabel?.text = movie.title
		cell.detailTextLabel?.text = movie.overview
		
		return cell
	}
}
