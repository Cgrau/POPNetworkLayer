//
//  LoginNetwork.swift
//  POPNetworkingLayer
//
//  Created by Carles Grau Galvan on 15/02/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation

enum LoginService: ServiceEnum {
    case authorize(username: String, password: String)
    case invalidateSession()
}

struct SessionNetworkFactory: Networking {
    typealias EnumType = LoginService
    static func getService(from type: EnumType) -> Requestable {
        switch type {
        case .authorize(let username, let password):
            return LoginNetwork(user: username, pass: password)
        case .invalidateSession():
            return SessionNetwork()
        }
    }
}

extension SessionNetworkFactory {
    private struct LoginNetwork: Requestable {
        
        private var username: String
        private var password: String
        
        var method: HTTPMethod = .post
        
        var path: String = "session"
        
        var parameters: [String : String] {
            return [
                "username": username,
                "password": password
            ]
        }
        
        init(user: String, pass: String){
            self.username = user
            self.password = pass
        }
        
    }
}

extension SessionNetworkFactory {
    private struct SessionNetwork: Requestable {
        var method: HTTPMethod = .get
        
        var path: String = ""
        
        var parameters: [String : String] = [:]
    }
}
