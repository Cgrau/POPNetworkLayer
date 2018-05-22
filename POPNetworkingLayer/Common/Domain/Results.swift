//
//  SimpleModel.swift
//  POPNetworkingLayer
//
//  Created by Carles Grau Galvan on 14/02/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let results: [Person]
}

struct Person: Decodable {
    let gender: String
    let name: Name
    struct Name: Decodable {
        let title: String
        let first: String
        let last: String
    }
}
