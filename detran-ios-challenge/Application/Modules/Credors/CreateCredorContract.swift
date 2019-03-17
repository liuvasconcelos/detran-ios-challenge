//
//  CreateCredorContract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

protocol CreateCredorViewContract {
    func showSuccessAlert()
    func showLoader()
    func hideLoader()
    func showError()
}

protocol CreateCredorPresenterContract {
    func sendFormToCreate(credor: ContractRequest)
}

