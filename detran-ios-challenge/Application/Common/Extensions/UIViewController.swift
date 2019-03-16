//
//  UIViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func fromNib<T: UIViewController>() -> T? {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as? T
    }
    
    func show(loader: UIActivityIndicatorView) {
        loader.center           = self.view.center
        loader.hidesWhenStopped = true
        loader.style            = UIActivityIndicatorView.Style.gray
        
        self.view.addSubview(loader)
        loader.startAnimating()
    }
    
    func hide(loader: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            loader.stopAnimating()
        }
    }
    
}

