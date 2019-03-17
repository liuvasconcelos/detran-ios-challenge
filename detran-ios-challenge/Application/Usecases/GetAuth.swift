//
//  GetAuth.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

class GetAuth {
    
    private weak var remoteDataSource: AuthenticationRemoteDataSource?
    
    init(remoteDataSource: AuthenticationRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func authorize(authRequest: AuthRequest, _ authCallBack: @escaping (BaseCallback<AuthResponse>) -> Void) {
        remoteDataSource?.authorize(authRequest: authRequest) { (callback) in
            callback.onSuccess { (authResponse) in
                let callbackSuccess = BaseCallback.success(authResponse)
                authCallBack(callbackSuccess)
            }
            
            callback.onFailed { error in
                let callbackFailed = BaseCallback<AuthResponse>.failed(error: error)
                authCallBack(callbackFailed)
            }
            
        }
        
    }
    
}


