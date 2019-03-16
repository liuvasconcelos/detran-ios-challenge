//
//  DetroySession.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

class DestroySession {
    
    private weak var sessionlocalDataSource: SessionLocalDataSource?
    
    init(localDataSource: SessionLocalDataSource) {
        self.sessionlocalDataSource = localDataSource
    }
    
    func destroySession() -> Bool? {
        let isSessionDestroyed = sessionlocalDataSource?.destroySession()
        
        return isSessionDestroyed.or(false)
    }
    
}
