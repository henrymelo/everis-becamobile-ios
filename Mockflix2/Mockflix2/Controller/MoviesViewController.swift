//
//  MoviesViewController.swift
//  Mockflix2
//
//  Created by Lucas Werner Kuipers on 06/04/2021.
//

import UIKit

class MoviesViewController: UIViewController {

	// MARK: - Gobal Constants

//	let moviesProvider = MoviesProvider()

	// MARK: - Global Variables

	var movies = [Movie]()

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		fetchData()
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		hideNavigationBar()
	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		showNavigationBar()
	}

	// MARK: - Fetch Data

	func fetchData() {
		movies = MoviesProvider.requestMoviesList(category: .TopRated)
	}

	// MARK: - Setup UI

	func setupUI() {
	}

	func hideNavigationBar() {
		// Hide the navigation bar on the this view controller
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}
	func showNavigationBar() {
		// Hide the navigation bar on the this view controller
		self.navigationController?.setNavigationBarHidden(false, animated: true)
	}
}
