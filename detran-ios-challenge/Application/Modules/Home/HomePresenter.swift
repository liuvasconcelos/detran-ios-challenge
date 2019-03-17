//
//  HomePresenter.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class HomePresenter: HomePresenterContract {
    
    private let view: HomeViewContract
    private let destroySession: DestroySession
    
    init(view: HomeViewContract, destroySession: DestroySession) {
        self.view           = view
        self.destroySession = destroySession
    }
    
    
    func logout() {
        let isSessionDestroyed = destroySession.destroySession().or(false)
        if isSessionDestroyed {
            self.view.didDestroySessionSuccess()
        }
    }
}
