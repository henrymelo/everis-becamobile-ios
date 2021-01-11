//
//  DetalhesDoFilmeViewController.swift
//  Filmes
//
//  Created by Letycia Sobrinho Marques on 09/01/21.
//

import UIKit

class DetalhesDoFilmeViewController: UIViewController {
    
    // MARK: IBOutlets - detalhes filmes
    
    @IBOutlet weak var tituloFilme: UILabel!
    @IBOutlet weak var imagemDoFilme: UIImageView!
    @IBOutlet weak var textoSinopse: UILabel!
    @IBOutlet weak var textoLancamento: UILabel!
    
    
    // MARK: IBAction
    
    @IBAction func voltar(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Variveis
    let detalheDoMeuFilme:FilmesAPI = FilmesAPI("fda3fa048b5dd1721be8d5512626b16a")
    var meuFilme:[String:Any]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarFilme()
    }
    
    //MARK: Metodos
    func mostrarFilme() {
        guard let filme = meuFilme as? [String:Any] else {
            print("Erro ao pegar detalhe geral")
            return
        }
        
        guard let id = filme["id"] as? Int else {
            print("Não foi possível resgatar o id")
            return
        }
        
        guard let titulo = filme["titulo"] as? String else {
            print("Não foi possível resgatar o Titulo")
            return
        }
        
        guard let imagem = filme["imagem"] as? UIImage else {
            print("Não foi possível resgatar a Imagem")
            return
        }
        
        
        detalheDoMeuFilme.detalheFilme(id) {
            (retorno) in
            guard let sinopse = retorno["overview"] as? String else {
                print("Não foi possível restagar a sinopse")
                return
            }
            guard let lancamento = retorno["release_date"] as? String else {
                print("Não foi possível restagar a data de lançamento")
                return
            }
            
            let lancamentoParaFomatar:[String] = lancamento.components(separatedBy: "-")
            let lancamentoFinal = "\(lancamentoParaFomatar[2])/\(lancamentoParaFomatar[1])/\(lancamentoParaFomatar[0])"
            
            self.textoLancamento.text = lancamentoFinal
            self.textoSinopse.text = sinopse
            self.tituloFilme.text = titulo
            self.imagemDoFilme.image = imagem
        }
        
    }
    
}
