//
//  FilmeResultTableViewController.swift
//  cinesofa
//
//  Created by Fabricio Rodrigo Baixo on 1/10/21.
//  Copyright © 2021 Fabricio Rodrigo Baixo. All rights reserved.
//

import UIKit

class FilmeResultTableViewController: UITableViewController {

    private let urlResult = "https://api.themoviedb.org/3/trending/all/week?api_key=214c206d6a89ab0b5b38efbcc5a71587&language=pt-BR"
    private var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaFilmesDaSemana()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let celula = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FilmeResultTableViewCell
////
////        celula.imageUrl.text = results[indexPath.row].overview
////        celula.titleLabel.text = results[indexPath.row].title
////
//       return celula
//    }
    
    // MARK - Func
    
        func listaFilmesDaSemana(){
    
            guard let urlFilmes = URL(string: urlResult)else{return}
    
            let request = URLRequest(url:urlFilmes)
    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
    
                   if let error = error {
                       print(error)
                       return
                   }
    
                   // Parse JSON data
                   if let data = data {
                    self.results = self.criaObjetoResult(data: data)
    
                       // Reload table view
                       OperationQueue.main.addOperation({
                           self.tableView.reloadData()
                       })
                   }
               })
    
               task.resume()
        }
    
    func criaObjetoResult(data: Data) -> [Result]{
        
        var results = [Result]()
        
        let decoder = JSONDecoder()
  
            do {
                let resultDataStore = try decoder.decode(ResultDataStore.self, from: data)
                results = resultDataStore.results
            } catch {
                print(error)
            }
     
        return results
    }

}
