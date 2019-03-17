//
//  AuthenticationRemoteDataSource.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

public protocol AuthenticationRemoteDataSource: class {
    func authorize(authRequest: AuthRequest, _ callback: @escaping (BaseCallback<AuthResponse>) -> Void )
}
