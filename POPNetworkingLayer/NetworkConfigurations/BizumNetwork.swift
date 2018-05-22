//
//  BizumNetwork.swift
//  POPNetworkingLayer
//
//  Created by Carles Grau Galvan on 15/02/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation

enum BizumService: ServiceEnum {
    case sendMoney(amount: String, user: String)
    case requestMoney(amount: String, user: String)
}

struct BizumNetworkFactory: Networking {
    typealias EnumType = BizumService
    static func getService(from type: EnumType) -> Requestable {
        switch type {
        case .sendMoney(let amount, let user):
            return BizumSendMoneyNetwork(amount: amount, user: user)
        case .requestMoney(let amount, let user):
            return BizumRequestMoneyNetwork(amount: amount, user: user)
        }
    }
}

//MARK: - Bizum - SendMoney
extension BizumNetworkFactory {
    private struct BizumSendMoneyNetwork: Requestable {
        private var amount: String
        private var user: String
        
        init(amount: String, user: String){
            self.amount = amount
            self.user = user
        }
        
        var method: HTTPMethod = .post
        
        var path: String = "sendMoney"
        
        var parameters: [String : String] {
            return [
                "amount": amount,
                "user": user
            ]
        }
    }
}

//MARK: - Bizum - RequestMoney
extension BizumNetworkFactory {
    private struct BizumRequestMoneyNetwork: Requestable {
        private var amount: String
        private var user: String
        
        init(amount: String, user: String){
            self.amount = amount
            self.user = user
        }
        
        var method: HTTPMethod = .get
        
        var path: String = "requestMoney"
        
        var parameters: [String : String] {
            return [
                "amount": amount,
                "user": user
            ]
        }
    }
}


