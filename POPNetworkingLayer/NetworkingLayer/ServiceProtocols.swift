//
//  ServiceProtocols.swift
//  POPNetworkingLayer
//
//  Created by Carles Grau Galvan on 16/02/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation

protocol ServiceEnum {}

protocol Networking {
    associatedtype EnumType: ServiceEnum
    static func getService(from type: EnumType) -> Requestable
}
