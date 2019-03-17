//
//  AuthRequest.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

public struct AuthRequest: Codable {
    
    let financialsCode: Int?
    let userName: String?
    let password: String?
    
    init(financialsCode: Int,
         userName: String,
         password: String) {
        self.financialsCode = financialsCode
        self.userName       = userName
        self.password       = password
    }
    
    enum CodingKeys: String, CodingKey {
        case password
        case financialsCode = "financials_code"
        case userName = "username"
    }
}
