//
//  CharacterRepository.swift
//  characters
//
//  Created by Nguyen Vien on 9/8/24.
//

import Foundation
import CoreModule

protocol CharacterRepositoryProtocol: AnyObject {
    func fetchCharacter() async throws -> [CharacterModel]?
}

class CharacterRepository: CharacterRepositoryProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchCharacter() async throws -> [CharacterModel]? {
        try await networkService.get(type: [CharacterModel].self, endPoint: CharacterEndpoint.getCharacter)
    }
}
