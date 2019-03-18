//
//  Home.swift
//  detran-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//
import XCTest

class Home {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var logoutButton: XCUIElement {
        return app.buttons["logoutButton"]
    }
    
    var contractListButton: XCUIElement {
        return app.buttons["contractListButton"]
    }
    
    var createContractButton: XCUIElement {
        return app.buttons["createContractButton"]
    }
    
    var createVehicleButton: XCUIElement {
        return app.buttons["createVehicleButton"]
    }
    
    var createCreditorButton: XCUIElement {
        return app.buttons["createCreditorButton"]
    }
    
    func checkIfUserIsLoggedAndLogout() {
        if logoutButton.exists {
            logout()
            sleep(2)
        }
    }
    
    func logout() {
        logoutButton.tap()
    }
    
    func goToContractListScreen() {
        contractListButton.tap()
        sleep(2)
    }
    
    func goToCreateContractScreen() {
        createContractButton.tap()
        sleep(2)
    }
    
    func goToCreateVehicleScreen() {
        createVehicleButton.tap()
        sleep(2)
    }
    
    func goToCreateCreditorScreen() {
        createCreditorButton.tap()
        sleep(2)
    }
}

