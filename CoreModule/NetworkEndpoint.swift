//
//  NetworkEndpoint.swift
//  characters
//
//  Created by Nguyen Vien on 9/8/24.
//

import Foundation

public protocol NetworkEndpointProtocol {
    var url: URL? {get}
    var host: String {get}
    var path: String {get}
    var header: [String: Any] {get}
    var queryItems: [URLQueryItem] {get}
}

public extension NetworkEndpointProtocol {
    var host: String {
        "bobsburgers-api.herokuapp.com"
    }
    var path: String {
        "characters/"
    }
    var header: [String: Any] {
        [ "Accept": "application/json",
          "Content-Type": "application/json"
        ]
    }
    var queryItems: [URLQueryItem] {
        []
    }
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path =  "/\(path)"
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}
