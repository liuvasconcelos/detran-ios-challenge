//
//  SessionLocalDataSourceImpl.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper
import ObjectMapper

public class SessionLocalDataSourceImpl: SessionLocalDataSource {
    
    public static let shared = SessionLocalDataSourceImpl()
    
    public func save(auth: AuthResponse) {
        setTokenInformationToKeyChain(auth: auth)
    }
    
    fileprivate func setTokenInformationToKeyChain(auth: AuthResponse) {
        var jsonData: Data?
        let jsonEncoder = JSONEncoder()
        
        do { jsonData = try jsonEncoder.encode(auth) } catch {}
        
        let json = String(data: jsonData!, encoding: String.Encoding.utf8)
        KeychainWrapper.standard.set(json!, forKey: "auth")
    }
    
    public func isLogged() -> Bool {
        return getAuthInfoFromKeyChain().token != ""
    }
    
    public func destroySession() -> Bool {
        let authRemoved: Bool = KeychainWrapper.standard.removeObject(forKey: "auth")
        
        return authRemoved
    }
    
    public func getAuthInfoFromKeyChain() -> AuthResponse {
        let auth = KeychainWrapper.standard.string(forKey: "auth").or("")
        return Mapper<AuthResponse>().map(JSONString: auth).or(AuthResponse(financialUser: FinancialUser(uuid: "", financialsCode: 0, name: ""),
                                                                            token: ""))
    }
    
}
