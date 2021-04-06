//
//  TituloView.swift
//  Mod02
//
//  Created by Henrique Melo on 06/04/21.
//

import Foundation
import UIKit

class TituloEveris: UIView {
    
    @IBOutlet private var titulo: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupUI(titulo: "ttttt")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setupUI(titulo: "AAA")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func addTitulo(titulo: String, y: Int, cor: UIColor) {
        let vTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        vTitle.text = titulo
        vTitle.textAlignment = .center
        vTitle.center = CGPoint(x: 160, y: y)
        vTitle.backgroundColor = cor
        self.addSubview(vTitle)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupUI(cor: EverisBecaColor) {
        self.backgroundColor = cor.corSelecionada
    }
}
