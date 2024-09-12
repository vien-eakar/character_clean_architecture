//
//  CharacterEndpoint.swift
//  characters
//
//  Created by Nguyen Vien on 9/8/24.
//

import Foundation
import CoreModule

enum CharacterEndpoint {
    case getCharacter
}

extension CharacterEndpoint: NetworkEndpointProtocol {
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []
        switch self {
            case .getCharacter:
                items.append(URLQueryItem(name: "limit", value: "20"))
                items.append(URLQueryItem(name: "skip", value: "265"))
        }
        return items
    }
}
