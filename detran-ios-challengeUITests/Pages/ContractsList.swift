//
//  ContractsList.swift
//  detran-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest

class ContractsList {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var navigationBarTitle: XCUIElement {
        return app.navigationBars.firstMatch.otherElements.firstMatch
    }
    
    var tableView: XCUIElement {
        return app.tables["contractsTableView"]
    }
    
}

