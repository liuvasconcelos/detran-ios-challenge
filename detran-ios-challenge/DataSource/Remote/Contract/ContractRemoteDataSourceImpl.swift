//
//  ContractRemoteDataSourceImpl.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import Alamofire

public class ContractRemoteDataSourceImpl: ContractRemoteDataSource {
    
    public static let shared = ContractRemoteDataSourceImpl()
    
    public func loadContracts(_ callback: @escaping (BaseCallback<[Contract]>) -> Void) {
        let path = "detran/public/contracts"
        var request = RequestUtils.getRequest(object: "", path: path, method: .get)
        
        let code = RequestUtils.getCode()
        
        request.setValue(String(code), forHTTPHeaderField: "code")

        Alamofire.request(request).validate(statusCode: 200..<299).responseArray { (response: DataResponse<[Contract]>) in
            switch response.result {
            case .success:
                if let response = response.result.value {
                    let callbackSuccess = BaseCallback.success(response)
                    callback(callbackSuccess)
                }
                
            case .failure(let error):
                let callbackFailed = BaseCallback<[Contract]>.failed(error: error.localizedDescription)
                callback(callbackFailed)
            }
        }
    }
    
    public func sendFormToCreate(contract: ContractRequest, _ callback: @escaping (BaseCallback<Contract>) -> Void) {
        let path    = "detran/public/contracts"
        let request = RequestUtils.getRequest(object: contract, path: path, method: .post)
        
        Alamofire.request(request).validate(statusCode: 200..<299).responseObject { (response: DataResponse<Contract>) in
            switch response.result {
            case .success:
                if let response = response.result.value {
                    let callbackSuccess = BaseCallback.success(response)
                    callback(callbackSuccess)
                }
                
            case .failure(let error):
                if response.response?.statusCode == 400 {
                    self.sendFormToCreate(contract: ContractRequest(request: contract), callback)
                    return
                }
                
                let callbackFailed = BaseCallback<Contract>.failed(error: error.localizedDescription)
                callback(callbackFailed)
            }
        }
    }
}
