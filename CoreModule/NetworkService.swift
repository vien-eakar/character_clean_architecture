//
//  NetworkService.swift
//  characters
//
//  Created by Nguyen Vien on 9/8/24.
//

import Foundation

public protocol NetworkServiceProtocol: AnyObject {
    func get<T: Decodable>(type: T.Type, endPoint: NetworkEndpointProtocol) async throws -> T
}

public final class NetworkService: NetworkServiceProtocol {
    
    private var session: URLSession!
    
    public init() {
        session = URLSession(configuration: .default)
    }
    
    
    public func get<T: Decodable>(type: T.Type, endPoint: NetworkEndpointProtocol) async throws -> T {
        guard let url = endPoint.url else {
            throw NetworkError.badURL
        }
        var request = URLRequest(url: url)
        endPoint.header.forEach { (key, value) in
            if let value = value as? String {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        let (data, response) = try await session.data(for: request) //URLSession.shared.data(for: request)
        guard let responseStatus = response as? HTTPURLResponse, responseStatus.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        var result: T!
        do {
            result = try JSONDecoder().decode(type, from: data)
        }catch {
            throw NetworkError.dataError
        }
        return result
    }
}
