//
//  AuthResponse.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class AuthResponse: Codable, Mappable {
    
    var financialUser: FinancialUser?
    var token: String?
    
    init(financialUser: FinancialUser, token: String) {
        self.financialUser = financialUser
        self.token         = token
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        financialUser <- map["FinancialUser"]
        token         <- map["Token"]
        financialUser <- map["financialUser"]
        token         <- map["token"]
    }
    
    enum CodingKeys: String, CodingKey {
        case financialUser = "FinancialUser"
        case token         = "Token"
    }
    
}
