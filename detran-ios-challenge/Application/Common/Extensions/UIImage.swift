//
//  UIImage.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

extension UIImage {
    func getCompressedData() -> Data {
        let actualHeight: CGFloat       = self.size.height
        let actualWidth: CGFloat        = self.size.width
        let imgRatio: CGFloat           = actualWidth/actualHeight
        let maxWidth: CGFloat           = 1024.0
        let resizedHeight: CGFloat      = maxWidth/imgRatio
        let compressionQuality: CGFloat = 0.5
        
        let rect: CGRect = CGRect(x: 0, y: 0, width: maxWidth, height: resizedHeight)
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        let img: UIImage    = UIGraphicsGetImageFromCurrentImageContext()!
        let imageData: Data =  img.jpegData(compressionQuality: compressionQuality)!
        UIGraphicsEndImageContext()
        
        return imageData
    }
}
