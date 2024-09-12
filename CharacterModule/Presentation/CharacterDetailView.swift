//
//  CharacterDetailView.swift
//  characters
//
//  Created by Nguyen Vien on 9/5/24.
//

import SwiftUI

struct CharacterDetailView: View {
    
    let character: CharacterModel
    
    var body: some View {
        VStack {
            AsyncImage(url: character.imageUrl) { image in
                image.resizable()
                    .frame(width: 300, height: 300)
            } placeholder: {
                ProgressView()
            }
            .padding()
            
            Text("Name : \(character.name)")
                .font(.title)
            
            if let first = character.firstEpisode {
                Text("First Episode: \(first)")
                    .font(.title2)
            }
            if let voicedBy = character.voicedBy {
                Text("Voiced By : \(voicedBy)")
            }

        }
    }
}

#Preview {
    CharacterDetailView(character: CharacterModel.simple)
}
