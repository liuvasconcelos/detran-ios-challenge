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
        var request = RequestUtils.getRequestWithObjectsSent(path: path, method: .get)
        
        var code = RequestUtils.getCode()
        
        request.setValue(String(1001), forHTTPHeaderField: "code")

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
}
