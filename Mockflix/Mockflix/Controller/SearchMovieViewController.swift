//
//  SearchMovieViewController.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 31/03/2021.
//

import UIKit

class SearchMovieViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
	
	
	var selectedMovieID = -1
	
	var movieSearchResults = [Movie]()
	let movieRequester = MoviesRequester()
	
	@IBOutlet weak var movieSearchBar: UISearchBar!
	@IBOutlet weak var movieSarchResultsTableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		movieSearchBar.becomeFirstResponder()
    }
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
	
		let query = searchText.replacingOccurrences(of: " ", with: "%20")
		let category = "search/movie"
		let extra = "&language=en-US&query=\(query)&page=1"
		
		if query.count > 0 {
			movieSearchResults = movieRequester.request(forCategory: category, withExtra: extra)
			
			movieSarchResultsTableView.reloadData()
		}

	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		self.movieSearchBar.endEditing(true)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movieSearchResults.count // movieSearchResults.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let movieSearchResultCell = tableView.dequeueReusableCell(withIdentifier: "movieSearchResultCell")
		movieSearchResultCell?.textLabel?.text = movieSearchResults[indexPath.row].title
		
		let movie = movieSearchResults[indexPath.row]
		
		movieSearchResultCell?.textLabel!.text = movie.title
		
		return movieSearchResultCell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if movieSearchResults.count <= 0 {
			selectedMovieID = -1
		} else {
			selectedMovieID = movieSearchResults[indexPath.row].id
			print(selectedMovieID)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Passing this view controller as a variable to the next screen (in order to access selected movie index
		if let viewController = segue.destination as? MovieDetailsSearchViewController {
			viewController.searchBarViewController = self
		}
	}

}
