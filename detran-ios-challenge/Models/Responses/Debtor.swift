//
//  Debtor.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class Debtor: Codable, Mappable {
    
    var uf: String?
    var cep: String?
    var type: String?
    var neighborhood: String?
    var address: String?
    var phoneNumber: String?
    var city: String?
    var financed: String?
    var addressNumber: Int?
    var cpfCnpj: String?
    var addressComplement: String?
    
    init(uf: String, cep: String, type: String, neighborhood: String, address: String, phoneNumber: String,
         city: String, financed: String, addressNumber: Int, cpfCnpj: String, addressComplement: String) {
        self.uf                = uf
        self.cep               = cep
        self.type              = type
        self.neighborhood      = neighborhood
        self.address           = address
        self.phoneNumber       = phoneNumber
        self.city              = city
        self.financed          = financed
        self.addressNumber     = addressNumber
        self.cpfCnpj           = cpfCnpj
        self.addressComplement = addressComplement
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        uf                <- map["uf"]
        cep               <- map["cep"]
        type              <- map["tipo"]
        neighborhood      <- map["bairro"]
        address           <- map["endereco"]
        phoneNumber       <- map["telefone"]
        city              <- map["municipio"]
        financed          <- map["financiado"]
        addressNumber     <- map["endereco_numero"]
        cpfCnpj           <- map["numero_cpf_cnpj"]
        addressComplement <- map["endereco_numero_complement"]
    }
    
}
