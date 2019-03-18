//
//  LoginViewControllerUITests.swift
//  detran-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest
@testable import detran_ios_challenge

class LoginViewControllerUITests: XCTestCase {
    let app = XCUIApplication()
    
    var loginScreen: Login?
    var homeScreen: Home?
    
    var bundle: Bundle?
    
    override func setUp() {
        super.setUp()
        bundle       = Bundle(for: LoginViewControllerUITests.self)
        loginScreen  = Login(app: app)
        homeScreen   = Home(app: app)
        app.launch()
        homeScreen?.checkIfUserIsLoggedAndLogout()
    }
    
    func testLaunchAppWithCorrectInformation() {
        XCTAssertEqual(loginScreen?.loginButton.label, "Login")
    }
    
    func testLoginWithBothFieldsEmpty() {
        loginScreen?.clickToLogin()
        
        XCTAssertEqual(loginScreen?.usernameTextField.placeholderValue, "Required Field")
        XCTAssertEqual(loginScreen?.passwordTextField.placeholderValue, "Required Field")
    }
    
    func testLoginSuccessful() {
        loginScreen?.typeValidUsernameAndPasswordAndTryToLogin()
        XCTAssertTrue(homeScreen?.logoutButton.exists ?? false)
    }
    
    func testLogoutAfterLogin() {
        loginScreen?.typeValidUsernameAndPasswordAndTryToLogin()
        homeScreen?.logout()
        
        XCTAssertTrue(loginScreen?.loginButton.exists ?? false)
    }
    
}

