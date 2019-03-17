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
    
    init(view: ContractsListViewContract, getContract: GetContract) {
        self.view        = view
        self.getContract = getContract
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
            
            callback.onFailed { _ in
                self.view.hideLoader()
                self.view.showError()
            }
        }
    }
    
}

