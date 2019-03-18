//
//  ContractsListPresenter.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class ContractsListPresenter: ContractsListPresenterContract {
    
    private let view: ContractsListViewContract
    private let getContract: GetContract
    private let getAuth: GetAuth
    private let saveSession: SaveSession
    
    init(view: ContractsListViewContract, getContract: GetContract, getAuth: GetAuth, saveSession: SaveSession) {
        self.view        = view
        self.getContract = getContract
        self.getAuth     = getAuth
        self.saveSession = saveSession
    }
    
    func loadContracts() {
        self.view.showLoader()
        getContract.loadContracts { (callback) in
            callback.onSuccess { contracts in
                self.view.hideLoader()
                self.view.show(contracts: contracts)
            }
            
            callback.onEmptyData {
                self.view.hideLoader()
                self.view.showEmptyMessage()
            }
            
            callback.onFailed { error in
                
                if error as? String == "auth" {
                    self.getAuth.authorize(authRequest: RequestUtils.getAuthRequest(), { (callback) in
                        callback.onSuccess { authResponse in
                            self.saveSession.saveSession(auth: authResponse)
                            self.view.hideLoader()
                            self.loadContracts()
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

