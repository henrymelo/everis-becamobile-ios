//
//  DetalhesDAO.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 09/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import CoreData

class DetalhesDAO: NSObject {

    var gerenciadorDeResultados:NSFetchedResultsController<Detalhes>?
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var detalhesViewController:DetalhesViewController?
    
    func recuperaDetalhes() -> Array<Detalhes> {
        let pesquisaDetalhes:NSFetchRequest<Detalhes> = Detalhes.fetchRequest()
        let ordenaPorTitulo = NSSortDescriptor(key: "title", ascending: true)
        pesquisaDetalhes.sortDescriptors = [ordenaPorTitulo]
        
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: pesquisaDetalhes, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try gerenciadorDeResultados?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
        guard let listaDeDetalhes = gerenciadorDeResultados?.fetchedObjects else { return [] }
        
        return listaDeDetalhes
    }
    
    func salvaDetalhes(dicionarioDeDetalhes:Dictionary<String, Any>) {
        let detalhes = Detalhes(context: contexto)
        
        detalhes.title = dicionarioDeDetalhes["title"] as? String
        detalhes.overview = dicionarioDeDetalhes["overview"] as? String
        
        guard let id = dicionarioDeDetalhes["id"] else { return }
        if (id is String) {
            detalhes.id = Int64((dicionarioDeDetalhes["id"] as! NSString).integerValue)
        }
        else {
            let conversaoDeId = String(describing: id)
            detalhes.id = Int64((conversaoDeId as NSString).integerValue)
        }
        
        guard let voteAverage = dicionarioDeDetalhes["vote_average"] else { return }
        if (voteAverage is String) {
            detalhes.vote_average = (dicionarioDeDetalhes["vote_average"] as! NSString).doubleValue
        }
        else {
            let conversaoDeVoteAverage = String(describing: voteAverage)
            detalhes.vote_average = (conversaoDeVoteAverage as NSString).doubleValue
        }
        
        atualizaContexto()
        
    }
    
    func atualizaContexto() {
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }

}
