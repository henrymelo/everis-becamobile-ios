//
//  DetalhesViewController.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 08/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import CoreData

class DetalhesViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var capaImagem: UIImageView!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var detalhesSelecionado:Array<Detalhes> = []
    var tendencia:Tendencia?
    var detalhes:Array<Detalhes> = []

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        limpaCoreDataDetalhes()
        
        guard let tendenciaSelecionada = tendencia else { return }
        Repositorio().recuperaDetalhes(tendenciaSelecionada) { (listaDeDetalhes) in
            self.detalhes = listaDeDetalhes
            
            print(self.detalhes[0].title)
            let title = self.detalhes[0].title
            let descricao = self.detalhes[0].overview
            let rating = self.detalhes[0].vote_average
            self.tituloLabel.text = title
            self.descricaoLabel.text = descricao
            self.ratingLabel.text = String(rating)
        }
    }
    

    // MARK: - Métodos

    func limpaCoreDataDetalhes() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Detalhes"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }


}
