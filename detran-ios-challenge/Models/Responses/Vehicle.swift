//
//  Vehicle.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class Vehicle: Codable, Mappable {
    
    var chassis: String?
    var renavam: String?
    var ufBoard: String?
    var reprice: String?
    var modelYear: Int?
    var manufactureYear: Int?
    var ufGravameRegister: String?
    
    init(chassis: String, renavam: String, ufBoard: String, reprice: String, modelYear: Int, manufactureYear: Int, ufGravameRegister: String) {
        self.chassis           = chassis
        self.renavam           = renavam
        self.ufBoard           = ufBoard
        self.reprice           = reprice
        self.modelYear         = modelYear
        self.manufactureYear   = manufactureYear
        self.ufGravameRegister = ufGravameRegister
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        chassis           <- map["chassi"]
        renavam           <- map["renavam"]
        ufBoard           <- map["uf_placa"]
        reprice           <- map["remarcado"]
        modelYear         <- map["ano_do_modelo"]
        manufactureYear   <- map["ano_de_fabricacao"]
        ufGravameRegister <- map["uf_registro_gravame"]
    }
    
    enum CodingKeys: String, CodingKey {
        case chassis           = "chassi"
        case renavam           = "renavam"
        case ufBoard           = "uf_placa"
        case reprice           = "remarcado"
        case modelYear         = "ano_do_modelo"
        case manufactureYear   = "ano_de_fabricacao"
        case ufGravameRegister = "uf_registro_gravame"
    }
    
}
