//
//  CreateContractViewControllerPhotoPickerExtension.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit
import YangMingShan

extension CreateContractViewController: YMSPhotoPickerViewControllerDelegate {
    
    func photoPickerViewControllerDidReceivePhotoAlbumAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        let alertController = UIAlertController(title: "", message: "Need permission", preferredStyle: .alert)
        let dismissAction  = UIAlertAction(title: AppStrings.cancel, style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }
        
        alertController.addAction(dismissAction)
        alertController.addAction(settingsAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func photoPickerViewControllerDidReceiveCameraAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        let alertController = UIAlertController(title: "", message: "Need permission", preferredStyle: .alert)
        let dismissAction  = UIAlertAction(title: AppStrings.cancel, style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }
        
        alertController.addAction(dismissAction)
        alertController.addAction(settingsAction)
        
        picker.present(alertController, animated: true, completion: nil)
    }
    
    func photoPickerViewController(_ picker: YMSPhotoPickerViewController!, didFinishPickingImages photoAssets: [PHAsset]!) {
        picker.dismiss(animated: true) {
            let images = photoAssets.map { asset -> UIImage in
                self.getUIImage(asset: asset) ?? UIImage()
            }
            
            self.imagesSelected += images
            self.photosAmountLabel.text = "\(AppStrings.amount_photos): \(self.imagesSelected.count)"
        }
    }
    
    private func getUIImage(asset: PHAsset) -> UIImage? {
        var image: UIImage?
        let imageManager               = PHImageManager.init()
        let options                    = PHImageRequestOptions.init()
        options.deliveryMode           = .highQualityFormat
        options.resizeMode             = .exact
        options.isSynchronous          = true
        options.isNetworkAccessAllowed = true
        
        imageManager.requestImageData(for: asset, options: options) { data, _, _, _ in
            if let data = data {
                image = UIImage(data: data)
            }
        }
        return image
    }
    
}

