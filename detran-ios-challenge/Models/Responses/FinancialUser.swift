//
//  FinancialUser.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class FinancialUser: Codable, Mappable {
    
    var uuid: String?
    var financialsCode: Int?
    var name: String?
    var password: String = ""
    var userName: String = ""
    
    init(uuid: String, financialsCode: Int, name: String) {
        self.uuid           = uuid
        self.financialsCode = financialsCode
        self.name           = name
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        uuid           <- map["UUID"]
        financialsCode <- map["financials_code"]
        name           <- map["Name"]
        uuid           <- map["uuid"]
        financialsCode <- map["financialsCode"]
        name           <- map["name"]
        password       <- map["password"]
        userName       <- map["userName"]
    }
    
    public func set(password: String) {
        self.password = password
    }
    
    public func set(userName: String) {
        self.userName = userName
    }
    
}
