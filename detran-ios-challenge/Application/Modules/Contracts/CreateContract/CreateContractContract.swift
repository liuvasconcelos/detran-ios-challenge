//
//  CreateContractContract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

protocol CreateContractViewContract {
    func showSuccessAlert()
    func showLoader()
    func hideLoader()
    func showError()
}

protocol CreateContractPresenterContract {
    func sendFormToCreate(contract: ContractRequest)
}
