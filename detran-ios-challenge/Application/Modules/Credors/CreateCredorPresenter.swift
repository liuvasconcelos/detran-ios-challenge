//
//  CreateCredorPresenter.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class CreateCredorPresenter: CreateCredorPresenterContract {
    
    private let view: CreateCredorViewContract
    private let createContract: CreateContract
    
    init(view: CreateCredorViewContract, createContract: CreateContract) {
        self.view           = view
        self.createContract = createContract
    }
    
    func sendFormToCreate(credor: ContractRequest) {
        self.view.showLoader()
        createContract.sendFormToCreate(contract: credor) { (callback) in
            callback.onSuccess({ (_) in
                self.view.hideLoader()
                self.view.showSuccessAlert()
            })
            callback.onFailed({ (_) in
                self.view.hideLoader()
                self.view.showError()
            })
        }
    }
}
