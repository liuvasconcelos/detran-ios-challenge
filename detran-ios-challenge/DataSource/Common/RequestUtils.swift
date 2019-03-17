//
//  RequestUtils.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper
import ObjectMapper
import AlamofireObjectMapper

struct RequestUtils {
    
    public static func getRequest<T: Codable>(object: T, path: String, method: HTTPMethod) -> URLRequest {
        let token      = getToken()
        let urlRequest = "http://159.65.244.68/\(path)"
        var request    = URLRequest(url: URL(string: urlRequest)!)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        if let authenticationToken = token {
            request.setValue("Bearer \(authenticationToken)", forHTTPHeaderField: "Authorization")
        }
        
        request.httpBody = getJsonData(object: object)
        
        return request
    }
    
    public static func getJsonData<T: Codable>(object: T) -> Data {
        var jsonData: Data?
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        do { jsonData = try jsonEncoder.encode(object) } catch {}
        
        return jsonData!
    }
    
    public static func getToken() -> String? {
        return KeychainWrapper.standard.string(forKey: "token")
    }
    
    public static func getRequestWithObjectsSent(path: String, method: HTTPMethod) -> URLRequest {
        var token: String?
        
        let urlRequest = "http://159.65.244.68/\(path)"
        var request    = URLRequest(url: URL(string: urlRequest)!)
        
        let authSaved = KeychainWrapper.standard.string(forKey: "auth").or("")
        let auth      = Mapper<AuthResponse>().map(JSONString: authSaved)
        
        if let validAuth = auth {
            token = validAuth.token
        }
        
        request.httpMethod = method.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        if let authenticationToken = token {
            request.setValue("Bearer \(authenticationToken)", forHTTPHeaderField: "Authorization")
        }

        return request
    }
    
    public static func getCode() -> Int {
        var financialsCode: Int?
        let authSaved = KeychainWrapper.standard.string(forKey: "auth").or("")
        let auth      = Mapper<AuthResponse>().map(JSONString: authSaved)
        
        if let validAuth = auth {
            financialsCode = validAuth.financialUser?.financialsCode
        }
        
        return financialsCode ?? 0
    }
    
    
}
