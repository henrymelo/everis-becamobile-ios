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
//    func xibSetup() {
//        backgroundColor = UIColor.clear
//        view = fromNib()
//        view.frame = bounds
//        addSubview(view)
//        view.translatesAutoresizingMaskIntoConstraints = false
//    }
}

extension UIView {
    
    public static var bundleUI: Bundle {
        var bundle: Bundle
        if let b = Bundle(identifier: "bankios.apptest.Mod02") {
            bundle = b
        } else {
            bundle = Bundle(for: self)
        }
        return bundle
    }
    
    public class func fromNib() -> Self {
        return fromNib(viewType: self)
    }
    
    public class func fromNib<T: UIView>(viewType: T.Type) -> T {
        if let nib = bundleUI.loadNibNamed(
        String(describing: viewType), owner: nil, options: nil)?.first as? T {
            return nib
        }
        return T()
    }
    
}

extension ViewEveris {
    func loadNib() -> ViewEveris {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! ViewEveris
    }
}

extension TituloEveris {
    func loadNib() -> TituloEveris {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! TituloEveris
    }
}
