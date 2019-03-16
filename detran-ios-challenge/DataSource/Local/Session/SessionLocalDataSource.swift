//
//  SessionLocalDataSource.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

public protocol SessionLocalDataSource: class {
    func save(auth: AuthResponse)
    func destroySession() -> Bool
}
