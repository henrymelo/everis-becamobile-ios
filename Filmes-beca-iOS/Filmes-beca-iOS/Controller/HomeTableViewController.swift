//
//  HomeTableViewController.swift
//  Filmes-beca-iOS
//
//  Created by Thiago Bittencourt Coelho on 07/01/21.
//  Copyright © 2021 Thiago Bittencourt Coelho. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    let filmesAPI = FilmesRequisition()
    
    var filmesToShow:[[String:Any]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        recuperaImages()
    }
    override func viewWillAppear(_ animated: Bool) {
        //
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filmesToShow.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let filme = filmesToShow[indexPath.row]
        
        
        
        guard let imagemDoFilme = filme["imagem"] as? UIImage else { return celula }
        
        celula.imageView?.image = imagemDoFilme
        
        return celula
    }

    func recuperaImages() {
        
        filmesAPI.getImagens { (filmes) in
            self.filmesToShow = filmes
            if(self.filmesToShow.count>5) {
                self.tableView.reloadData()
            }
        }
    }
    
}
