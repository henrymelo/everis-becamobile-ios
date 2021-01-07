//
//  Filme.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 07/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import CoreData

class FilmeDAO: NSObject {
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
//    enum CodingKeys: String, CodingKey{
//        case vote_average, titulo = "título", visaoGeral = "visão geral", release_date,adulto,backdrop_path,genre_ids
//
//    }
    //MARK: - Outlets
    
    var vote_average: String
    let visaoGeral: String
    let release_date: String
    let adulto: String
    let backdrop_path: String
    let genre_ids: String
    let vote_count: String
    let original_language: String
    let original_title: String
    let id: String
    let video: String
    let popularidade: String
    let media_type: String
    
    init(vote_average: String, visaoGeral: String,release_date: String,adulto: String,backdrop_path: String,genre_ids:String,vote_count: String, original_language: String,original_title: String, id: String, video: String, popularidade: String,media_type: String){
        self.vote_average = vote_average
        self.visaoGeral = visaoGeral
        self.release_date = release_date
        self.adulto = adulto
        self.backdrop_path = backdrop_path
        self.genre_ids = genre_ids
        self.vote_count = vote_count
        self.original_language = original_language
        self.original_title = original_title
        self.id = id
        self.video = video
        self.popularidade = popularidade
        self.media_type = media_type
    }
    
    convenience override init() {
        self.init(vote_average: "", visaoGeral: "", release_date: "", adulto: "", backdrop_path: "", genre_ids: "", vote_count: "", original_language: "", original_title: "", id: "", video: "", popularidade: "", media_type: "")
    }
    
    
//    func desserializa(json: [[String: Any]]) -> [Filme]{
//        var listaDeFilmes: [Filme] = []
//
//        for filme in json{
//            guard let vote_average = filme["vote_average"] as? String else {return listaDeFilmes}
//            guard let visaoGeral = filme["overview"] as? String else {return listaDeFilmes}
//            guard let original_title = filme["original_title"] as? String else {return listaDeFilmes}
//            guard let release_date = filme["release_date"] as? String else {return listaDeFilmes}
//            guard let adulto = filme["adulto"] as? String else {return listaDeFilmes}
//            guard let backdrop_path = filme["backdrop_path"] as? String else {return listaDeFilmes}
//            guard let genre_ids = filme["genre_ids"] as? String else {return listaDeFilmes}
//            guard let vote_count = filme["vote_count"] as? String else {return listaDeFilmes}
//            guard let id = filme["id"] as? String else {return listaDeFilmes}
//            guard let original_language = filme["original_language"] as? String else {return listaDeFilmes}
//            guard let popularidade = filme["popularidade"] as? String else {return listaDeFilmes}
//            guard let media_type = filme["media_type"] as? String else {return listaDeFilmes}
//            guard let video = filme["media_type"] as? String else {return listaDeFilmes}
//
//            let novaLista =  Filme(vote_average: vote_average, visaoGeral: visaoGeral, release_date: release_date, adulto: adulto, backdrop_path: backdrop_path, genre_ids: genre_ids, vote_count: vote_count, original_language: original_language, original_title: original_title, id: id, video: video, popularidade: popularidade, media_type: media_type)
//
//            listaDeFilmes.append(novaLista)
//        }
//
//        return listaDeFilmes
//    }
    
    
    
    func montaDicionario() -> Dictionary<String, String>{
        
        guard let original_title: String = original_title else {return [:]}
        guard let visaoGeral: String = original_language else {return [:]}
        guard let vote_average: String = vote_average else {return [:]}
        guard let release_date: String = release_date else {return [:]}
        guard let adulto: String = adulto else {return [:]}
        guard let backdrop_path: String = backdrop_path else {return [:]}
        guard let genre_ids: String = genre_ids else {return [:]}
        guard let vote_count: String = vote_count else {return [:]}
        guard let original_language: String = original_language else {return [:]}
        guard let id: String = id else {return [:]}
        guard let video: String = video else {return [:]}
        guard let popularidade: String = popularidade else {return [:]}
         guard let media_type: String = media_type else {return [:]}
        
        
        let dicionario:Dictionary<String, String> = [
            "original_title": original_title,
            "visaoGeral": visaoGeral,
            "vote_average": vote_average,
            "release_date": release_date,
            "adulto": adulto,
            "backdrop_path": backdrop_path,
            "genre_ids": genre_ids,
            "vote_count": vote_count,
            "original_language": original_language,
            "id": id,
            "video": video,
            "popularidade": popularidade,
            "media_type": media_type
        ]
        
        return dicionario
        
    }
    
    
    func salvaFilme(dicionarioDeFilme: Dictionary<String, Any>) {
    let filme = Filme(context: contexto)
        filme.origin_title = dicionarioDeFilme["origin_title"] as? String
        filme.visaoGeral = dicionarioDeFilme["visaoGeral"] as? String
        filme.vote_average = dicionarioDeFilme["vote_average"] as? String
        filme.release_date = dicionarioDeFilme["release_date"] as? String
        filme.backdrop_path = dicionarioDeFilme["backdrop_path"] as? String
        filme.genre_ids = dicionarioDeFilme["genre_ids"] as? String
        filme.vote_count = dicionarioDeFilme["vote_count"] as? String
        filme.original_language = dicionarioDeFilme["original_language"] as? String
        filme.id = dicionarioDeFilme["id"] as? String
        filme.video = dicionarioDeFilme["video"] as? String
        filme.popularidade = dicionarioDeFilme["popularidade"] as? String
        filme.media_type = dicionarioDeFilme["media_type"] as? String
        
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



