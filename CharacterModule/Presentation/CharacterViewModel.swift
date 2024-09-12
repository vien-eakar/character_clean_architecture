//
//  CharacterViewModel.swift
//  characters
//
//  Created by Nguyen Vien on 9/8/24.
//

import Foundation

enum ViewStatus {
    
    case notRequest
    case fetching
    case success
    case fail(error: Error)
}

class CharacterViewModel: ObservableObject {
    @Published var listCharacter: [CharacterModel] = []
    @Published var status: ViewStatus = .notRequest
    
    private let characterService: CharacterServiceProtocol
    
    init(characterService: CharacterServiceProtocol = CharacterService()) {
        self.characterService = characterService
    }
    @MainActor
    func fetchCharacters() async {
        self.status = .fetching
        do {
            if let data = try await self.characterService.getCharacter() {
                self.listCharacter = data
            }
            self.status = .success
        }catch {
            print("== api erorr : \(error)")
            self.status = .fail(error: error)
        }
    }
}

