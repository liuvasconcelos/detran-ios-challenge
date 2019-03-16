//
//  LoginContract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

protocol LoginViewContract {
    func loginSuccessful()
    func showLoader()
    func hideLoader()
    func show(error: String)
}

protocol LoginPresenterContract {
    func login(financialsCode: Int, userName: String, password: String)
}

