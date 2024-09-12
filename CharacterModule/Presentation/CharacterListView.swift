//
//  CharacterListView.swift
//  characters
//
//  Created by Nguyen Vien on 9/8/24.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationStack {
            switch viewModel.status {
                case .notRequest:
                    EmptyView()
                case .fetching:
                    ProgressView()
                case .success:
                    List(viewModel.listCharacter) { character in
                        NavigationLink(value: character) {
                            HStack {
                                AsyncImage(url: character.imageUrl ) { image in
                                    image.resizable()
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                } placeholder: {
                                    ProgressView()
                                }
                                Text(character.name)
                            }
                            .frame(minHeight: 50)
                        }
                    }
                    .navigationDestination(for: CharacterModel.self, destination: { character in
                        CharacterDetailView(character: character)
                    })
                    .navigationTitle("Character List")
                    
                case .fail(let error):
                    Text(" have problem when fetch chracter! \(error) ")
                        .onAppear {
                            print(" eeorro : \(error.localizedDescription)")
                        }
            }
        }
        .task {
            await viewModel.fetchCharacters()
        }
    }
}

#Preview {
    CharacterListView()
}
