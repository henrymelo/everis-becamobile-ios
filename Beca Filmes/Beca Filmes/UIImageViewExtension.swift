//
//  UIImageViewExtension.swift
//  Beca Filmes
//
//  Created by Lucas Abdel Leitao on 11/01/21.
//  Copyright © 2021 Lucas Abdel Leitao. All rights reserved.
//

import UIKit
import Alamofire


extension UIImageView{
    
    func loadImage(imgpath: String) {
        

        let url = "https://image.tmdb.org/t/p/w500/\(imgpath)"
        Alamofire.request(url).responseImage { (response) in
            if let image = response.result.value{
                DispatchQueue.main.async {
                    self.image = image
                }
                
            }
        }
    }
    
}
