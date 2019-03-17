//
//  ContractRequest.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

public struct ContractRequest: Codable {
    
    let code: Int?
    let financialUsersUuid: String?
    let endUsersDocument: String?
    var data: String?
    
    init(code: Int,
         endUsersDocument: String,
         personal: Personal?, contract: InsideContract?, vehicle: Vehicle?) {
        self.code               = code
        self.financialUsersUuid = RequestUtils.getUserUuid()
        self.endUsersDocument   = endUsersDocument
        self.data               = ""
        if let personalRequest = personal, let contractRequest = contract {
            self.data = RequestUtils.getJsonDataString(object: ContractData(personal: personalRequest,
                                                                            contract: contractRequest))
        } else if let vehicleRequest = vehicle {
            self.data = RequestUtils.getJsonDataString(object: VehicleData(vehicle: vehicleRequest))
        }
       
    }
    
    init(request: ContractRequest) {
        self.code               = request.code! + 1
        self.financialUsersUuid = RequestUtils.getUserUuid()
        self.endUsersDocument   = request.endUsersDocument
        self.data               = request.data ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case code, data
        case financialUsersUuid = "financial_users_uuid"
        case endUsersDocument   = "endusers_document"
    }
}

public struct ContractData: Codable {
    
    let personal: Personal?
    let contract: InsideContract?
    
    init(personal: Personal, contract: InsideContract) {
        self.personal = personal
        self.contract = contract
    }
    
    enum CodingKeys: String, CodingKey {
        case personal
        case contract = "contrato"
    }

}

public struct VehicleData: Codable {
    
    let vehicle: Vehicle?
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    enum CodingKeys: String, CodingKey {
        case vehicle = "veiculo"
    }
    
}
