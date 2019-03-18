//
//  CreateCredorViewControllerUITests.swift
//  detran-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest
@testable import detran_ios_challenge

class CreateCredorViewControllerUITests: XCTestCase {
    let app = XCUIApplication()
    
    var loginScreen: Login?
    var homeScreen: Home?
    var createCredorScreen: CreateCredor?
    
    var bundle: Bundle?
    
    override func setUp() {
        super.setUp()
        bundle              = Bundle(for: CreateCredorViewControllerUITests.self)
        loginScreen         = Login(app: app)
        homeScreen          = Home(app: app)
        createCredorScreen  = CreateCredor(app: app)
        app.launch()
        homeScreen?.checkIfUserIsLoggedAndLogout()
        loginScreen?.typeValidUsernameAndPasswordAndTryToLogin()
        homeScreen?.goToCreateCreditorScreen()
    }
    
    func testOpeningOfScreenWithCorrectInformation() {
        self.checkNavigationInformation()
    }
    
    fileprivate func checkNavigationInformation() {
        XCTAssertEqual(createCredorScreen?.navigationBarTitle.label, "Register a credor")
    }
}

