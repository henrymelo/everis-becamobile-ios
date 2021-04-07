//
//  TituloView.swift
//  Mod02
//
//  Created by Henrique Melo on 06/04/21.
//

import Foundation
import UIKit


protocol TituloEverisDelegate: class {
    func buttonAction()
}

public class TituloEveris: UIView {
    public var view: UIView!
    
    weak var delegage: TituloEverisDelegate?
    var buttonAction: (() -> Void)?


    let nibName = "TituloEveris"
    var contentView:UIView?
    var titulox = ""
    
    struct enumTitulo {
        let name: String
        let background: UIColor
    }
    
    @IBOutlet weak var titulo: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInit()
    }
    
    init(title: String) {
        super.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.titulox = "ffff"
        layoutIfNeeded()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupUICell()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupUIView()
    }
    
    public func addTitulo(titulo: String, y: Int, cor: UIColor) {
        let vTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        vTitle.text = titulo
        vTitle.textAlignment = .center
        vTitle.center = CGPoint(x: 160, y: y)
        vTitle.backgroundColor = cor
        self.addSubview(vTitle)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func setupInit() {
        if self.titulox.isEmpty {
          self.titulox = "Texto Inicial"
        }
        //self.titulo?.text = titulox

        //setupUI(title: String)
    }
    
    private func setupUICell() {
        //"setupUICell será quando herdar por exemplo um UICollectionViewCell"
        self.titulo?.text = titulox
        //setupUI(title: String)
    }
    
    private func setupUIView() {
        //"Padrao setupUIView"
        self.titulo?.text = titulox
        //setupUI(title: String)
    }
    
    public func setupUI(title: String) {
        self.titulox = title
    }
    
    @IBAction func botaoOuTituloAction(_ sender: UIButton) {
            if let _buttonAction = buttonAction {
                _buttonAction()
            } else {
                delegage?.buttonAction()
            }
        }
}
