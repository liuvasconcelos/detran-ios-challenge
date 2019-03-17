//
//  SaveSession.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

class SaveSession {
    
    private weak var localDataSource: SessionLocalDataSource?
    
    init(localDataSource: SessionLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func saveSession(auth: AuthResponse) {
        localDataSource?.save(auth: auth)
    }
    
}

