//
//  AuthenticationRemoteDataSourceImpl.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import Alamofire

public class AuthenticationRemoteDataSourceImpl: AuthenticationRemoteDataSource {
    
    public static let shared = AuthenticationRemoteDataSourceImpl()
    
    public func authorize(authRequest: AuthRequest, _ apiAuthCallback: @escaping (BaseCallback<AuthResponse>) -> Void) {
        let path    = "auth/financial"
        let request = RequestUtils.getRequest(object: authRequest, path: path, method: .post)
        
        Alamofire.request(request).validate(statusCode: 200..<299).responseObject { (response: DataResponse<AuthResponse>) in
            switch response.result {
            case .success(let authResponse):
                let response = authResponse
                response.financialUser?.set(password: authRequest.password ?? "")
                response.financialUser?.set(userName: authRequest.userName ?? "")
                let callbackSuccess = BaseCallback.success(response)
                apiAuthCallback(callbackSuccess)
            case .failure(let error):
                let callbackFailed = BaseCallback<AuthResponse>.failed(error: error.localizedDescription)
                apiAuthCallback(callbackFailed)
            }
        }
        
    }
    
}
