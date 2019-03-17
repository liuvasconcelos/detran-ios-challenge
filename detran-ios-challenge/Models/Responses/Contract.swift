//
//  Contract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class Contract: Codable, Mappable {
    
    var code: Int?
    var financialUsersUuid: String?
    var endusersDocument: String?
    var vehicle: Vehicle?
    var personal: Personal?
    var financing: Financing?
    var insideContract: InsideContract?
    var debtor: Debtor?
    var credor: Credor?
    var detranStatus: Bool?
    var status: Bool?
    var createdAt: String?
    var updatedAt: String?
    var financialsCode: Int?
    
    init(code: Int, financialUsersUuid: String, endusersDocument: String, vehicle: Vehicle,
         personal: Personal, financing: Financing, insideContract: InsideContract, debtor: Debtor,
         credor: Credor, detranStatus: Bool, status: Bool, createdAt: String, updatedAt: String, financialsCode: Int) {
        self.code               = code
        self.financialUsersUuid = financialUsersUuid
        self.endusersDocument   = endusersDocument
        self.vehicle            = vehicle
        self.personal           = personal
        self.financing          = financing
        self.insideContract     = insideContract
        self.debtor             = debtor
        self.credor             = credor
        self.detranStatus       = detranStatus
        self.status             = status
        self.createdAt          = createdAt
        self.updatedAt          = updatedAt
        self.financialsCode     = financialsCode
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        code               <- map["code"]
        financialUsersUuid <- map["financial_users_uuid"]
        endusersDocument   <- map["endusers_document"]
        vehicle            <- map["data.veiculo"]
        personal           <- map["data.personal"]
        financing          <- map["data.financiamento"]
        insideContract     <- map["data.contrato"]
        debtor             <- map["data.devedor"]
        credor             <- map["data.credor"]
        detranStatus       <- map["status_detran"]
        status             <- map["status"]
        createdAt          <- map["created_at"]
        updatedAt          <- map["last_update"]
        financialsCode     <- map["financials_code"]
    }
    
}
