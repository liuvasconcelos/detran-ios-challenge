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
        name           <- map["name"]
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case uuid = "UUID"
        case financialsCode = "financials_code"
    }
    
}
