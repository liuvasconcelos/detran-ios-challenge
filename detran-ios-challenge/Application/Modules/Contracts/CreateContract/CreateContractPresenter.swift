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
    
    init(view: CreateContractViewContract, createContract: CreateContract, getAuth: GetAuth, saveSession: SaveSession) {
        self.view           = view
        self.createContract = createContract
        self.getAuth        = getAuth
        self.saveSession    = saveSession
    }
    
    func sendFormToCreate(contract: ContractRequest) {
        self.view.showLoader()
        createContract.sendFormToCreate(contract: contract) { (callback) in
            callback.onSuccess({ (_) in
                self.view.hideLoader()
                self.view.showSuccessAlert()
            })
            
            callback.onFailed { error in
                
                if error as? String == "auth" {
                    self.getAuth.authorize(authRequest: RequestUtils.getAuthRequest(), { (callback) in
                        callback.onSuccess { authResponse in
                            self.saveSession.saveSession(auth: authResponse)
                            self.view.hideLoader()
                            self.sendFormToCreate(contract: contract)
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
}
