//
//  TendenciaTableViewController.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 08/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import CoreData

class TendenciaTableViewController: UITableViewController {
    
    // MARK: - Atributos
    
    var tendencias:Array<Tendencia> = []
    var detalhes:Array<Detalhes> = []
    var detalhesViewController:DetalhesViewController?
    var tendenciaSelecionada:Tendencia?
    
    var detalhesDAO:DetalhesDAO?
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//      limpaCoreData()
        recuperaTendencias()
    }
    
    
    // MARK: - Métodos
    
    func recuperaTendencias() {
        Repositorio().recuperaTendencias { (listaDeTendencias) in
            self.tendencias = listaDeTendencias
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tendencias.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "tendencia-celula", for: indexPath) as! TendenciaTableViewCell
        celula.tag = indexPath.row
        let tendencia = tendencias[indexPath.row]
        celula.configuraCelula(tendencia)
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selecionada = tendencias[indexPath.row]
        //detalhesViewController?.setup(tendenciaSelecionada)
        tendenciaSelecionada = selecionada
        performSegue(withIdentifier: "detalhes", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detalhes", let detalhesViewController = segue.destination as? DetalhesViewController else { return }
        detalhesViewController.tendencia = tendenciaSelecionada
    }
    
    
//    func limpaCoreData() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Detalhes"))
//        do {
//            try managedContext.execute(DelAllReqVar)
//        }
//        catch {
//            print(error)
//        }
//    }

}
