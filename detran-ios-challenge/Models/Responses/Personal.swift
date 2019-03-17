//
//  Personal.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class Personal: Codable, Mappable {
    
    var rg: String?
    var name: String?
    
    init(rg: String, name: String) {
        self.rg   = rg
        self.name = name
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        rg   <- map["rg"]
        name <- map["name"]
    }
    
}

