//
//  TendenciaDAO.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 08/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import UIKit
import CoreData

class TendenciaDAO: NSObject {
    
    // MARK: - Atributos
    
    var gerenciadorDeResultados:NSFetchedResultsController<Tendencia>?
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - Métodos
    
    func recuperaTendencia() -> Array<Tendencia> {
        let pesquisaTendencia:NSFetchRequest<Tendencia> = Tendencia.fetchRequest()
        let ordenaPorTitulo = NSSortDescriptor(key: "title", ascending: true)
        pesquisaTendencia.sortDescriptors = [ordenaPorTitulo]
        
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: pesquisaTendencia, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try gerenciadorDeResultados?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
        guard let listaDeTendencias = gerenciadorDeResultados?.fetchedObjects else { return [] }
        
        return listaDeTendencias
    }
    
    func salvaTendencia(dicionarioDeTendencia:Dictionary<String, Any>) {
        let tendencia = Tendencia(context: contexto)
        tendencia.poster_path = dicionarioDeTendencia["poster_path"] as? String
        tendencia.title = dicionarioDeTendencia["title"] as? String
        tendencia.overview = dicionarioDeTendencia["overview"] as? String
        tendencia.media_type = dicionarioDeTendencia["media_type"] as? String
        
        guard let id = dicionarioDeTendencia["id"] else { return }
        if (id is String) {
            tendencia.id = Int64((dicionarioDeTendencia["id"] as! NSString).integerValue)
        }
        else {
            let conversaoDeId = String(describing: id)
            tendencia.id = Int64((conversaoDeId as NSString).integerValue)
        }

        guard let voteAverage = dicionarioDeTendencia["vote_average"] else { return }
        if (voteAverage is String) {
            tendencia.vote_average = (dicionarioDeTendencia["vote_average"] as! NSString).doubleValue
        }
        else {
            let conversaoDeVoteAverage = String(describing: voteAverage)
            tendencia.vote_average = (conversaoDeVoteAverage as NSString).doubleValue
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
