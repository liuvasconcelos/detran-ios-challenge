//
//  Financing.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class Financing: Codable, Mappable {
    
    var plotValue: Int?
    var totalValueOfDebit: Int?
    var creditReleaseDate: String?
    
    init(plotValue: Int, totalValueOfDebit: Int, creditReleaseDate: String) {
        self.plotValue         = plotValue
        self.totalValueOfDebit = totalValueOfDebit
        self.creditReleaseDate = creditReleaseDate
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        plotValue         <- map["valor_parcela"]
        totalValueOfDebit <- map["valor_total_divida"]
        creditReleaseDate <- map["dt_liberacao_credito"]
    }
    
}
