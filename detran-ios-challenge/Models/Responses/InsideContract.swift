//
//  InsideContract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class InsideContract: Codable, Mappable {
    
    var indexes: String?
    var commission: Int?
    var lateFee: Int?
    var iofValue: Int?
    var mulct: Int?
    var comments: String?
    var gravameNumber: String?
    var restrictionType: String?
    var fineRate: Int?
    var lateFeeValue: Int?
    var contractDate: String?
    var numberOfMonths: Int?
    var fineRateValue: Int?
    var vendorDocumentType: String?
    var commitionIndication: String?
    var contractNumber: String?
    var recipientDocumentType: String?
    var amountOfInterestPerYear: Int?
    var amountOfInterestPerMonth: Int?
    var mulctIndication: String?
    var vendorCpfCnpj: String?
    var contractFeeValue: Int?
    var mainRecipientPayment: String?
    var mainRecipientCpfCnpj: String?
    
    init(indexes: String, commission: Int, lateFee: Int, iofValue: Int, mulct: Int, comments: String,
         gravameNumber: String, restrictionType: String, fineRate: Int, lateFeeValue: Int, contractDate: String,
         numberOfMonths: Int, fineRateValue: Int, vendorDocumentType: String, commitionIndication: String,
         contractNumber: String, recipientDocumentType: String, amountOfInterestPerYear: Int,
         amountOfInterestPerMonth: Int, mulctIndication: String, vendorCpfCnpj: String,
         contractFeeValue: Int, mainRecipientPayment: String, mainRecipientCpfCnpj: String) {
        self.indexes                  = indexes
        self.commission               = commission
        self.lateFee                  = lateFee
        self.iofValue                 = iofValue
        self.mulct                    = mulct
        self.comments                 = comments
        self.gravameNumber            = gravameNumber
        self.restrictionType          = restrictionType
        self.fineRate                 = fineRate
        self.lateFeeValue             = lateFeeValue
        self.contractDate             = contractDate
        self.numberOfMonths           = numberOfMonths
        self.fineRateValue            = fineRateValue
        self.vendorDocumentType       = vendorDocumentType
        self.commitionIndication      = commitionIndication
        self.contractNumber           = contractNumber
        self.recipientDocumentType    = recipientDocumentType
        self.amountOfInterestPerYear  = amountOfInterestPerYear
        self.amountOfInterestPerMonth = amountOfInterestPerMonth
        self.mulctIndication          = mulctIndication
        self.vendorCpfCnpj            = vendorCpfCnpj
        self.contractFeeValue         = contractFeeValue
        self.mainRecipientPayment     = mainRecipientPayment
        self.mainRecipientCpfCnpj     = mainRecipientCpfCnpj
        
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        indexes                  <- map["indices"]
        commission               <- map["comissao"]
        lateFee                  <- map["taxa_mora"]
        iofValue                 <- map["valor_iof"]
        mulct                    <- map["penalidade"]
        comments                 <- map["comentarios"]
        gravameNumber            <- map["numero_gravame"]
        restrictionType          <- map["tipo_restricao"]
        fineRate                 <- map["taxa_taxa_multa"]
        lateFeeValue             <- map["valor_taxa_mora"]
        contractDate             <- map["data_do_contrato"]
        numberOfMonths           <- map["quantidade_meses"]
        fineRateValue            <- map["valor_taxa_multa"]
        vendorDocumentType       <- map["tipo_doc_vendedor"]
        commitionIndication      <- map["indicacao_comissao"]
        contractNumber           <- map["numero_do_contrato"]
        recipientDocumentType    <- map["tipo_doc_recebedor"]
        amountOfInterestPerYear  <- map["valor_juros_ao_ano"]
        amountOfInterestPerMonth <- map["valor_juros_ao_mes"]
        mulctIndication          <- map["indicacao_penalidade"]
        vendorCpfCnpj            <- map["cpf_cnpj_vendedor_bem"]
        contractFeeValue         <- map["valor_taxa_de_contrato"]
        mainRecipientPayment     <- map["principal_recebedor_pagto"]
        mainRecipientCpfCnpj     <- map["cpf_cnpj_principal_recebedor_pagto"]
    }
    
    enum CodingKeys: String, CodingKey {
        case indexes                  = "indices"
        case commission               = "comissao"
        case lateFee                  = "taxa_mora"
        case iofValue                 = "valor_iof"
        case mulct                    = "penalidade"
        case comments                 = "comentarios"
        case gravameNumber            = "numero_gravame"
        case restrictionType          = "tipo_restricao"
        case fineRate                 = "taxa_taxa_multa"
        case lateFeeValue             = "valor_taxa_mora"
        case contractDate             = "data_do_contrato"
        case numberOfMonths           = "quantidade_meses"
        case fineRateValue            = "valor_taxa_multa"
        case vendorDocumentType       = "tipo_doc_vendedor"
        case commitionIndication      = "indicacao_comissao"
        case contractNumber           = "numero_do_contrato"
        case recipientDocumentType    = "tipo_doc_recebedor"
        case amountOfInterestPerYear  = "valor_juros_ao_ano"
        case amountOfInterestPerMonth = "valor_juros_ao_mes"
        case mulctIndication          = "indicacao_penalidade"
        case vendorCpfCnpj            = "cpf_cnpj_vendedor_bem"
        case contractFeeValue         = "valor_taxa_de_contrato"
        case mainRecipientPayment     = "principal_recebedor_pagto"
        case mainRecipientCpfCnpj     = "cpf_cnpj_principal_recebedor_pagto"
    }
}

