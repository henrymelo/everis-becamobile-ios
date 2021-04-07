//
//  ViewController.swift
//  Mod02
//
//  Created by Henrique Melo on 06/04/21.
//

import UIKit

enum Categoria: String {
    case Semana = "www.google.com.br"
    case Dia
    case Tudo
}

enum EverisBecaColor {
    case corEveris
    case corBeca
    case corIOS
    var corSelecionada: UIColor {
        switch self { //#colorLiteral()
        case .corEveris: return #colorLiteral(red: 0.4599122405, green: 0.7652553916, blue: 0.2607991099, alpha: 1)
        case .corBeca: return #colorLiteral(red: 0.926291585, green: 0.234855473, blue: 0.1111717001, alpha: 1)
        case .corIOS: return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
    }
}

extension UIColor
{
    static let novaCorViaExtension = #colorLiteral(red: 0, green: 0.4797380567, blue: 0.9984433055, alpha: 1)
}

extension UIColor {
  struct CoresEveris {
    static var firstColor: UIColor  { return UIColor(red: 1, green: 0, blue: 0, alpha: 1) }
    static var secondColor: UIColor { return UIColor(red: 0, green: 1, blue: 0, alpha: 1) }
  }
}

class ViewController: UIViewController {

    @IBOutlet weak var stack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        //Component com XIB
        let myView = ViewEveris().loadNib() // .fromNib()
        myView.backgroundColor = .cyan
        //stack.addArrangedSubview(myView)
        
        //fromNib()
        let myTitulo1 = TituloEveris.fromNib() // .fromNib()
        myTitulo1.setupUI(title: "titulo fromNib")
        stack.addArrangedSubview(myTitulo1)

        //loadNib()
        let myTitulo2 = TituloEveris(title: "aaaaadddd").loadNib()
        myTitulo2.setupUI(title: "cccccc")
        stack.addArrangedSubview(myTitulo2)

        //Component ViewCode puro
        let myTitulo3 = TituloEveris(title: "bbbb").loadNib()
        myTitulo3.backgroundColor = .cyan
        myTitulo3.setupUI(title: "cccccc")
        myTitulo3.addTitulo(titulo: "Everis novo Titulo", y: 80, cor: .yellow)
        myTitulo3.addTitulo(titulo: "Everis sub Titulo", y: 150, cor: .novaCorViaExtension)
        stack.addArrangedSubview(myTitulo3)
        
        
       // stack.translatesAutoresizingMaskIntoConstraints = false

        apiFilmes(categoria: .Semana, cor: .corEveris)
     }
    
    func apiFilmes(categoria: Categoria, cor: EverisBecaColor) {
        print("*******************************")
        print(categoria.rawValue)
        print(cor.corSelecionada)
        print("*******************************")
    }

}
 
