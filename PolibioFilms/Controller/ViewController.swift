//
//  ViewController.swift
//  PolibioFilms
//
//  Created by Artur Rodrigues Fortunato on 07/01/21.
//

import UIKit


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var teste: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReceberAPI().consumindoAPI(completion: { (testes) in
            print(testes.results[0].title)
        })
    }
    


}
