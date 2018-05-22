//
//  PostsNetwork.swift
//  POPNetworkingLayer
//
//  Created by Carles Grau Galvan on 15/02/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation

struct PostsNetwork: Requestable {
    var method: HTTPMethod = .get
    
    var path: String = ""
    
    var parameters: [String : String] {
        return [:]
    }
}
