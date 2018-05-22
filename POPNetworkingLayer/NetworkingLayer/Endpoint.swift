//
//  Endpoint.swift
//  POPNetworkingLayer
//
//  Created by Carles Grau Galvan on 14/02/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation

internal enum Endpoint {
    case getPosts
    case session(serviceType: LoginService)
    case bizum(serviceType: BizumService)
}

protocol Requestable {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

internal extension Endpoint {
	func request(with baseURL: URL) -> URLRequest {
		let url = baseURL.appendingPathComponent(properties.path)
        
        var newParameters = properties.parameters
        properties.parameters.forEach { newParameters.updateValue($1, forKey: $0) }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = newParameters.map(URLQueryItem.init)
        
        var request = URLRequest(url: components.url!)
		request.httpMethod = properties.method.rawValue

		return request
	}
}

enum HTTPMethod: String {
	case get = "GET"
    case post = "POST"
}

private extension Endpoint {
    var properties: Requestable {
        switch self {
        case .getPosts:
            return PostsNetwork()
        case .session(let serviceType):
            return SessionNetworkFactory.getService(from: serviceType)
        case .bizum(let serviceType):
            return BizumNetworkFactory.getService(from: serviceType)
        }
    }
}
