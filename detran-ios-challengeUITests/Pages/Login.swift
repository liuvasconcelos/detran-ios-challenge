//
//  Login.swift
//  detran-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest

class Login {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var loginButton: XCUIElement {
        return app.buttons["loginButton"]
    }
    
    var usernameTextField: XCUIElement {
        return app.textFields["usernameTextField"]
    }
    
    var passwordTextField: XCUIElement {
        return app.textFields["passwordTextField"]
    }
    
    func clickToLogin() {
        loginButton.tap()
    }
    
    func typeValidUsernameAndPasswordAndTryToLogin() {
        usernameTextField.tap()
        usernameTextField.typeText("a")
        self.app.tap()
        passwordTextField.tap()
        passwordTextField.typeText("a")
        self.app.tap()
        loginButton.tap()
        sleep(3)
    }
}

