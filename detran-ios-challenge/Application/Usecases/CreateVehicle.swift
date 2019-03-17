//
//  CreateVehicle.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

class CreateVehicle {
    
    private weak var remoteDataSource: ContractRemoteDataSource?
    
    init(remoteDataSource: ContractRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func sendFormToCreate(vehicle: ContractRequest, _ usecaseCallback: @escaping (BaseCallback<Contract>) -> Void) {
        remoteDataSource?.sendFormToCreate(contract: vehicle, { (callback) in
            callback.onSuccess({ (response) in
                let callbackSuccess = BaseCallback.success(response)
                usecaseCallback(callbackSuccess)
            })
            
            callback.onFailed({ (error) in
                let callbackFailed = BaseCallback<Contract>.failed(error: error)
                usecaseCallback(callbackFailed)
            })
        })
    }
    
}
