//
//  CharacterModel.swift
//  characters
//
//  Created by Nguyen Vien on 9/5/24.
//

import Foundation

//{
//    "id": 1,
//    "name": "\"Dottie Minerva\"",
//    "relatives": [],
//    "wikiUrl": "https://bobs-burgers.fandom.com/wiki/%22Dottie_Minerva%22",
//    "image": "https://bobsburgers-api.herokuapp.com/images/characters/1.jpg",
//    "gender": "Female",
//    "hair": "Blonde",
//    "occupation": "Student at Wagstaff School",
//    "allOccupations": [
//        "Student at Wagstaff School"
//    ],
//    "firstEpisode": "\"The Kids Run the Restaurant\"",
//    "voicedBy": "Wendy Molyneux",
//    "url": "https://bobsburgers-api.herokuapp.com/characters/1"
//}

struct CharacterModel: Decodable, Identifiable, Hashable {
    let id: Int
    let name : String
    let image: String
    let firstEpisode: String?
    let voicedBy: String?
    
    var imageUrl: URL {
        URL(string: image)!
    }
    
    static var simple : CharacterModel {
        return CharacterModel(id: 1, name: "test", image: "https://bobsburgers-api.herokuapp.com/images/characters/1.jpg", firstEpisode: "The Kids Run the Restaurant", voicedBy: "Wendy Molyneux")
    }
}

