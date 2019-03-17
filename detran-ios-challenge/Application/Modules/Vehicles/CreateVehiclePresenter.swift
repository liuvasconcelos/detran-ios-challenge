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
    private let createVehicle: CreateVehicle
    
    init(view: CreateVehicleViewContract, createVehicle: CreateVehicle) {
        self.view          = view
        self.createVehicle = createVehicle
    }
    
    func sendFormToCreate(vehicle: ContractRequest) {
        self.view.showLoader()
        createVehicle.sendFormToCreate(vehicle: vehicle) { (callback) in
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
