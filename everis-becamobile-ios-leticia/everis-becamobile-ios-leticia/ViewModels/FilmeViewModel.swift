//
//  FilmeViewModel.swift
//  everis-becamobile-ios-leticia
//
//  Created by Leticia Sousa Siqueira on 13/01/21.
//  Copyright © 2021 Leticia Sousa Siqueira. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol FilmeViewModelDelegate {
    func reloadData(filme: FilmeViewData)
}

class FilmeViewModel {
    
    // MARK: - Properts
    private let client: FilmeServiceProtocol
    var viewData: Bindable<FilmeViewData?> = Bindable(nil)
    var delegate: FilmeViewModelDelegate?
    
    //var lista:[Result]
    
    // MARK: - Constructors
    init(client: FilmeServiceProtocol = FilmeService()) {
        self.client = client
    }
    
    // MARK: - Methods
    
    // Tendência
    func recuperaTendencias(completion:@escaping(_ listaDeTendencias:Array<Tendencia>) -> Void) {
        var tendencias = TendenciaDAO().recuperaTendencia()
        
            client.recuperaTendenciasServidor {
                tendencias = TendenciaDAO().recuperaTendencia()
                completion(tendencias)
            }
    }
    
    func salvaTendencia(tendencia:Dictionary<String, Any>) {
        TendenciaDAO().salvaTendencia(dicionarioDeTendencia: tendencia)
    }
    
    func limpaCoreDataTendencia() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Tendencia"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
    
    // Detalhes
    func recuperaDetalhes(_ tendencia:Tendencia, completion:@escaping(_ listaDeDetalhes:Array<Detalhes>) -> Void) {
        var detalhes = DetalhesDAO().recuperaDetalhes()
        
        client.recuperaDetalhesServidor(tendencia) {
            detalhes = DetalhesDAO().recuperaDetalhes()
            completion(detalhes)
        }
    }
    
    func salvaDetalhes(detalhe:Dictionary<String, Any>) {
        DetalhesDAO().salvaDetalhes(dicionarioDeDetalhes: detalhe)
    }
    
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
