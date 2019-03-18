//
//  CreateVehicleViewControllerUITests.swift
//  detran-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest
@testable import detran_ios_challenge

class CreateVehicleViewControllerUITests: XCTestCase {
    let app = XCUIApplication()
    
    var loginScreen: Login?
    var homeScreen: Home?
    var createVehicleScreen: CreateVehicle?
    
    var bundle: Bundle?
    
    override func setUp() {
        super.setUp()
        bundle               = Bundle(for: CreateVehicleViewControllerUITests.self)
        loginScreen          = Login(app: app)
        homeScreen           = Home(app: app)
        createVehicleScreen  = CreateVehicle(app: app)
        app.launch()
        homeScreen?.checkIfUserIsLoggedAndLogout()
        loginScreen?.typeValidUsernameAndPasswordAndTryToLogin()
        homeScreen?.goToCreateVehicleScreen()
    }
    
    func testOpeningOfScreenWithCorrectInformation() {
        self.checkNavigationInformation()
    }
    
    fileprivate func checkNavigationInformation() {
        XCTAssertEqual(createVehicleScreen?.navigationBarTitle.label, "Register a vehicle")
    }
    
}

