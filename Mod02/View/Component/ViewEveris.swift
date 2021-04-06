//
//  EverisView.swift
//  Mod02
//
//  Created by Henrique Melo on 06/04/21.
//

import Foundation
import UIKit

class ViewEveris: UIView {
    var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        //xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        self.backgroundColor = .yellow
    }
}

private extension ViewEveris {
    func xibSetup() {
        backgroundColor = UIColor.clear
        view = loadNib()
        view.frame = bounds
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
