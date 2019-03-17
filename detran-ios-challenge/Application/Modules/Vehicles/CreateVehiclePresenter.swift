//
//  CreateVehiclePresenter.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class CreateVehiclePresenter: CreateVehiclePresenterContract {
    
    private let view: CreateVehicleViewContract
    private let createContract: CreateContract
    
    init(view: CreateVehicleViewContract, createContract: CreateContract) {
        self.view           = view
        self.createContract = createContract
    }
    
    func sendFormToCreate(vehicle: ContractRequest) {
        self.view.showLoader()
        createContract.sendFormToCreate(contract: vehicle) { (callback) in
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
