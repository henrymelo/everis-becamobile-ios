//
//  Filme.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit
import AlamofireImage

class Filme: NSObject {
    
    //MARK - Variaveis
    
    var titulo:String = ""
    var tagline:String = ""
    var budget:Int = 0
    var revenue:Int = 0
    var data:String = ""
    var generos:String = ""
    var sinopse:String = ""
    var caminhoImagemPoster:String = ""
    var caminhoImagemBg:String = ""
    var nota:String = ""
    
    
    //MARK: - Funcoes
    
    init(_ dicionario:Dictionary<String, Any>){
        
        guard let titulo = dicionario["title"] as? String else { return }
        self.titulo = titulo
        
        guard let caminhoImagemPoster = dicionario["poster_path"] as? String else { return }
        self.caminhoImagemPoster = caminhoImagemPoster
        
        guard let tagline = dicionario["tagline"] as? String else { return }
        self.tagline = tagline
        
        guard let budget = dicionario["budget"] as? Int else { return }
        self.budget = budget
        
        guard let revenue = dicionario["revenue"] as? Int else { return }
        self.revenue = revenue
        
        guard let data = dicionario["release_date"] as? String else { return }
        self.data = data
        
        guard let sinopse = dicionario["overview"] as? String else { return }
        self.sinopse = sinopse
        
        guard let caminhoImagemBg = dicionario["backdrop_path"] as? String else { return }
        self.caminhoImagemBg = caminhoImagemBg
        
        guard let DicionarioDeGeneros = dicionario["genres"] as? Array<Dictionary<String, Any>> else { return }
        
        for genero in DicionarioDeGeneros {
            guard let nomeGenero = genero["name"] as? String else { return }
            
            if generos == String(""){
                self.generos.append("\(nomeGenero) ")
            }else {
                self.generos.append("- \(nomeGenero) ")
            }
        }
        
        guard var nota = dicionario["vote_average"] as? Double else { return }
        nota = nota * 10
        nota = Double(nota).rounded()
        nota = nota / 10
        self.nota = String(nota)
        
        
    }
    
    
    func getBudgetFormatado() -> String{
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        if self.budget == 0 {
            return "Desconhecido"
        }else{
            let budgetFormatado = NSNumber(integerLiteral: self.budget)
            
            if let budgetFormatado = currencyFormatter.string(from: budgetFormatado) {
                return "\(budgetFormatado)"
            }
        }
        
        return "Desconhecido"
    }
    
    func getRevenueFormatado() -> String{
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        if self.revenue == 0 {
            return "Desconhecido"
        }else{
            let revenueFormatado = NSNumber(integerLiteral: self.revenue)
            
            if let revenueFormatado = currencyFormatter.string(from: revenueFormatado) {
                return "\(revenueFormatado)"
            }
        }
        
        return "Desconhecido"
    }


    
}


