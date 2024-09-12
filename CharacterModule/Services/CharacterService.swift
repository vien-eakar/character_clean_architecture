//
//  CharacterService.swift
//  characters
//
//  Created by Nguyen Vien on 9/8/24.
//

import Foundation

protocol CharacterServiceProtocol: AnyObject {
    func getCharacter() async throws -> [CharacterModel]?
}

class CharacterService: CharacterServiceProtocol {
    private let characterRepository: CharacterRepositoryProtocol
    
    init(characterRepository: CharacterRepositoryProtocol = CharacterRepository()) {
        self.characterRepository = characterRepository
    }
    
    func getCharacter() async throws -> [CharacterModel]? {
        try await characterRepository.fetchCharacter()
    }
}

