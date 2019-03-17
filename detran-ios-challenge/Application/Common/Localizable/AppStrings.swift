//
//  AppStrings.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

public class AppStrings {
    
    // General
    public static let required_field = localized("required_field")
    public static let reload         = localized("reload")
    public static let cancel         = localized("cancel")
    public static let back           = localized("back")
    
    // Login
    public static let login    = localized("login")
    public static let username = localized("username")
    public static let password = localized("password")
    
    // Home
    public static let see_all_contracts   = localized("see_all_contracts")
    public static let register_a_contract = localized("register_a_contract")
    public static let register_a_vehicle  = localized("register_a_vehicle")
    public static let register_a_credor   = localized("register_a_credor")
    public static let logout              = localized("logout")
    
    // Contracts list
    public static let contracts                   = localized("contracts")
    public static let contract_list_error_message = localized("contract_list_error_message")
    public static let contract_list_empty_message = localized("contract_list_empty_message")
    
    // Add a contract
    public static let personName                      = localized("personName")
    public static let rg                              = localized("rg")
    public static let indexes                         = localized("indexes")
    public static let commition                       = localized("commition")
    public static let late_fee                        = localized("late_fee")
    public static let iof_value                       = localized("iof_value")
    public static let mulct                           = localized("mulct")
    public static let comments                        = localized("comments")
    public static let gravame_number                  = localized("gravame_number")
    public static let restriction_type                = localized("restriction_type")
    public static let fine_rate                       = localized("fine_rate")
    public static let late_fee_value                  = localized("late_fee_value")
    public static let contract_date                   = localized("contract_date")
    public static let quantity_of_months              = localized("quantity_of_months")
    public static let fine_rate_value                 = localized("fine_rate_value")
    public static let vendor_document_type            = localized("vendor_document_type")
    public static let commition_indication            = localized("commition_indication")
    public static let contract_number                 = localized("contract_number")
    public static let recipient_document_type         = localized("recipient_document_type")
    public static let amount_interest_per_year        = localized("amount_interest_per_year")
    public static let amount_interest_per_month       = localized("amount_interest_per_month")
    public static let mulct_indication                = localized("mulct_indication")
    public static let vendor_cpf_cnpj                 = localized("vendor_cpf_cnpj")
    public static let contract_fee_value              = localized("contract_fee_value")
    public static let main_payment_recipient          = localized("main_payment_recipient")
    public static let main_payment_recipient_cpf_cnpj = localized("main_payment_recipient_cpf_cnpj")
    public static let add_a_contract_success_message  = localized("add_a_contract_success_message")
    public static let add_a_contract_error_message    = localized("add_a_contract_error_message")
    
    // Add a vehicle
    public static let chassi                        = localized("chassi")
    public static let renavam                       = localized("renavam")
    public static let board                         = localized("board")
    public static let reprice                       = localized("reprice")
    public static let model_year                    = localized("model_year")
    public static let manufacture_year              = localized("manufacture_year")
    public static let uf_gravame                    = localized("uf_gravame")
    public static let add_a_vehicle_success_message = localized("add_a_vehicle_success_message")
    public static let add_a_vehicle_error_message   = localized("add_a_vehicle_error_message")
    
    // Add a credor
    public static let uf                           = localized("uf")
    public static let cep                          = localized("cep")
    public static let neighborhood                 = localized("neighborhood")
    public static let address                      = localized("address")
    public static let phone_number                 = localized("phone_number")
    public static let city                         = localized("city")
    public static let financed                     = localized("financed")
    public static let address_number               = localized("address_number")
    public static let institution_name             = localized("institution_name")
    public static let complement                   = localized("complement")
    public static let type                         = localized("type")
    public static let add_a_credor_success_message = localized("add_a_credor_success_message")
    public static let add_a_credor_error_message   = localized("add_a_credor_error_message")

    public static func localized(_ value: String) -> String {
        return NSLocalizedString(value, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

