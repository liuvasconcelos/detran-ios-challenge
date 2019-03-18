//
//  CreateContract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class CreateContract {
    
    private weak var remoteDataSource: ContractRemoteDataSource?
    
    init(remoteDataSource: ContractRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func sendFormToCreate(contract: ContractRequest, _ usecaseCallback: @escaping (BaseCallback<Contract>) -> Void) {
        remoteDataSource?.sendFormToCreate(contract: contract, { (callback) in
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
    
    func sendPhoto(photo: UIImage, _ usecaseCallback: @escaping (BaseCallback<String>) -> Void) {
        remoteDataSource?.sendPhoto(photo: photo, { (callback) in
            callback.onSuccess({ (response) in
                let callbackSuccess = BaseCallback.success(response)
                usecaseCallback(callbackSuccess)
            })

            callback.onFailed({ (error) in
                let callbackFailed = BaseCallback<String>.failed(error: error)
                usecaseCallback(callbackFailed)
            })
        })
    }
}

