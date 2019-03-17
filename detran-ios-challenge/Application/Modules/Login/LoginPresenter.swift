//
//  LoginPresenter.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresenterContract {
    
    private let view: LoginViewContract
    private let getAuth: GetAuth
    private let saveSession: SaveSession
    private let getUserSession: GetUserSession
    
    init(view: LoginViewContract, getAuth: GetAuth, saveSession: SaveSession, getUserSession: GetUserSession) {
        self.view           = view
        self.getAuth        = getAuth
        self.saveSession    = saveSession
        self.getUserSession = getUserSession
    }
    
    func login(financialsCode: Int, userName: String, password: String) {
        self.view.showLoader()
        let auth = AuthRequest(financialsCode: financialsCode, userName: userName, password: password)
        getAuth.authorize(authRequest: auth) { (useCaseCallBack) in
            useCaseCallBack.onSuccess { (authResponse) in
                self.saveSession.saveSession(auth: authResponse)
                self.view.hideLoader()
                self.view.loginSuccessful()
            }
            
            useCaseCallBack.onFailed({ error in
                self.view.hideLoader()
                self.view.show(error: error.debugDescription)
            })
        }
    }
    
    func isUserLogged() -> Bool {
        return getUserSession.isUserLogged()
    }
    
}

