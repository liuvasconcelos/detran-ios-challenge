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
    
    init(view: CreateContractViewContract, createContract: CreateContract) {
        self.view           = view
        self.createContract = createContract
    }
    
    func sendFormToCreate(contract: ContractRequest) {
        self.view.showLoader()
        createContract.sendFormToCreate(contract: contract) { (callback) in
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
