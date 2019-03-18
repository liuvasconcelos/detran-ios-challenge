//
//  CreateContractPresenter.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class CreateContractPresenter: CreateContractPresenterContract {
    
    private let view: CreateContractViewContract
    private let createContract: CreateContract
    private let getAuth: GetAuth
    private let saveSession: SaveSession
    
    var remainingPhotos = [UIImage]()
    var successPhotos   = [String]()
    var failPhotos      = [String]()
    
    init(view: CreateContractViewContract, createContract: CreateContract, getAuth: GetAuth, saveSession: SaveSession) {
        self.view           = view
        self.createContract = createContract
        self.getAuth        = getAuth
        self.saveSession    = saveSession
    }
    
    func sendFormToCreate(contract: ContractRequest, photos: [UIImage]) {
        self.view.showLoader()
        self.remainingPhotos = photos
        self.sendContract(contract: contract, photos: photos)
    }
    
    fileprivate func sendContract(contract: ContractRequest, photos: [UIImage]) {
        createContract.sendFormToCreate(contract: contract) { (callback) in
            callback.onSuccess({ (_) in
                self.sendPhotos()
            })
            
            callback.onFailed { error in
                
                if error as? String == "auth" {
                    self.getAuth.authorize(authRequest: RequestUtils.getAuthRequest(), { (callback) in
                        callback.onSuccess { authResponse in
                            self.saveSession.saveSession(auth: authResponse)
                            self.view.hideLoader()
                            self.sendFormToCreate(contract: contract, photos: photos)
                            return
                        }
                        callback.onFailed({ (error) in
                            self.view.hideLoader()
                            self.view.showError()
                        })
                    })
                    return
                }
                self.view.hideLoader()
                self.view.showError()
            }
        }
    }
    
    
    fileprivate func sendPhotos() {
        if self.remainingPhotos.isEmpty {
            self.view.hideLoader()
            self.view.showSuccessAlert(successPhotos: successPhotos, failPhotos: failPhotos)
            return
        }
        createContract.sendPhoto(photo: remainingPhotos.first ?? UIImage()) { (callback) in
            callback.onSuccess({ (_) in
                self.successPhotos.append(self.remainingPhotos.first!.description)
                self.remainingPhotos.removeLast()
                self.sendPhotos()
            })
            callback.onFailed({ (error) in
                self.failPhotos.append(self.remainingPhotos.first!.description)
                self.remainingPhotos.removeLast()
                self.sendPhotos()
            })
        }
    }
}
