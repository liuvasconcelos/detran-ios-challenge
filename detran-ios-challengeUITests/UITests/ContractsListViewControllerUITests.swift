//
//  ContractsListViewControllerUITests.swift
//  detran-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest
@testable import detran_ios_challenge

class ContractsListViewControllerUITests: XCTestCase {
    let app = XCUIApplication()
    
    var loginScreen: Login?
    
    var bundle: Bundle?
    
    override func setUp() {
        super.setUp()
        bundle       = Bundle(for: ContractsListViewControllerUITests.self)
        loginScreen  = Login(app: app)
        app.launch()
    }
    
}
