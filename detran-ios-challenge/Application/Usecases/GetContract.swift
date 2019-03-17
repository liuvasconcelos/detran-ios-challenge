//
//  GetContract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

class GetContract {
    
    private weak var remoteDataSource: ContractRemoteDataSource?

    init(remoteDataSource: ContractRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func loadContracts(_ apiCallback: @escaping (BaseCallback<[Contract]>) -> Void) {
        remoteDataSource?.loadContracts({ (callback) in
            callback.onSuccess({ (contracts) in
                if !contracts.isEmpty {
                    let callbackSuccess = BaseCallback.success(contracts)
                    apiCallback(callbackSuccess)
                    return
                }
                let callbackEmpty = BaseCallback<[Contract]>.emptyData()
                apiCallback(callbackEmpty)
            })

            callback.onFailed({ (error) in
                let callbackFailed = BaseCallback<[Contract]>.failed(error: error)
                apiCallback(callbackFailed)
            })
        })
    }
}

