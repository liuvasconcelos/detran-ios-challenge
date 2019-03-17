//
//  CreateVehicleContract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

protocol CreateVehicleViewContract {
    func showSuccessAlert()
    func showLoader()
    func hideLoader()
    func showError()
}

protocol CreateVehiclePresenterContract {
    func sendFormToCreate(vehicle: ContractRequest)
}

