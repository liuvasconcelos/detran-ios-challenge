//
//  ContractsListContract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

protocol ContractsListViewContract {
    func show(contracts: [Contract])
    func showLoader()
    func hideLoader()
    func showError()
    func showEmptyMessage()
}

protocol ContractsListPresenterContract {
    func loadContracts()
}
