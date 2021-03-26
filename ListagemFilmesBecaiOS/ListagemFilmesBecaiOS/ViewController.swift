//
//  ViewController.swift
//  ListagemFilmesBecaiOS
//
//  Created by Lucas Werner Kuipers on 26/03/2021.
//

import UIKit
import Foundation
import Alamofire

class ViewController: UITableViewController {
	
	var movies = [Movie]()
	var portuguese = true
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		let baseURL = "https://api.themoviedb.org/3/trending/movie/day?"
		let apiKey = "b9455c6f8158f3b4819771909e7a9dbc"
		
		let language = portuguese ? "pt-BR" : "en"
		
		let urlString = "\(baseURL)api_key=\(apiKey)&language=\(language)"
		
		if let url = URL(string: urlString)  {
			if let data = try? Data(contentsOf: url) {
				parse(json: data)
			}
		}
	}
	
	func parse(json: Data) {
		let decoder = JSONDecoder()
		
		if let jsonMovies = try? decoder.decode(Movies.self, from: json) {
			movies = jsonMovies.results
			tableView.reloadData()
		}
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
