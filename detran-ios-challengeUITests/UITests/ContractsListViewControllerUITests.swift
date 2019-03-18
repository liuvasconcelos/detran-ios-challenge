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
    var homeScreen: Home?
    var contractsListScreen: ContractsList?

    var bundle: Bundle?
    
    override func setUp() {
        super.setUp()
        bundle              = Bundle(for: ContractsListViewControllerUITests.self)
        loginScreen         = Login(app: app)
        homeScreen          = Home(app: app)
        contractsListScreen = ContractsList(app: app)
        app.launch()
        homeScreen?.checkIfUserIsLoggedAndLogout()
        loginScreen?.typeValidUsernameAndPasswordAndTryToLogin()
        homeScreen?.goToContractListScreen()
    }
    
    func testOpeningOfScreenWithCorrectInformation() {
        self.checkNavigationInformation()
        self.checkTableViewInformation()
    }
    
    fileprivate func checkNavigationInformation() {
        XCTAssertEqual(contractsListScreen?.navigationBarTitle.label, "Contracts")
    }
    
    fileprivate func checkTableViewInformation() {
        XCTAssertEqual(contractsListScreen?.tableView.cells.count ?? 0, 157)
    }
    
}
