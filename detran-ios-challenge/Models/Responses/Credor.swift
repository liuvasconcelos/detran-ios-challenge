//
//  Credor.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class Credor: Codable, Mappable {
    
    var uf: String?
    var cep: String?
    var type: String?
    var neighborhood: String?
    var address: String?
    var phoneNumber: String?
    var city: String?
    var financed: String?
    var addressNumber: Int?
    var financialInstituteName: String?
    var addressComplement: String?
    
    init(uf: String, cep: String, type: String, neighborhood: String, address: String, phoneNumber: String,
         city: String, financed: String, addressNumber: Int, financialInstituteName: String, addressComplement: String) {
        self.uf                     = uf
        self.cep                    = cep
        self.type                   = type
        self.neighborhood           = neighborhood
        self.address                = address
        self.phoneNumber            = phoneNumber
        self.city                   = city
        self.financed               = financed
        self.addressNumber          = addressNumber
        self.financialInstituteName = financialInstituteName
        self.addressComplement      = addressComplement
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        uf                     <- map["uf"]
        cep                    <- map["cep"]
        type                   <- map["tipo"]
        neighborhood           <- map["bairro"]
        address                <- map["endereco"]
        phoneNumber            <- map["telefone"]
        city                   <- map["municipio"]
        financed               <- map["financiado"]
        addressNumber          <- map["endereco_numero"]
        financialInstituteName <- map["nome_agente_financeiro_instituicao_financeira"]
        addressComplement      <- map["endereco_numero_complement"]
    }
    
    enum CodingKeys: String, CodingKey {
        case uf                     = "uf"
        case cep                    = "cep"
        case type                   = "tipo"
        case neighborhood           = "bairro"
        case address                = "endereco"
        case phoneNumber            = "telefone"
        case city                   = "municipio"
        case financed               = "financiado"
        case addressNumber          = "endereco_numero"
        case financialInstituteName = "nome_agente_financeiro_instituicao_financeira"
        case addressComplement      = "endereco_numero_complement"
    }
    
}
