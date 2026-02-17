//
//  EpisodeDetailsView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

import SwiftUI

struct EpisodeDetailsView: View {
    
    //MARK: - Proeprties
    @EnvironmentObject private var charactersViewModel: CharactersViewModel
    
    @State private var charactersFeatured: [Character] = []
    
    var episode: Episode
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    //MARK: - Body
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            ZStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(episode.name)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.bottom, 12)
                    
                    Text("Air date")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Text(episode.airDate)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.white)
                        .padding(.bottom, 4)
                    
                    Text("Episode")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Text(episode.episode)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.white)
                        .padding(.bottom, 4)
                    
                    Text("Characters featured")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.bottom, 4)
                    
                    ScrollView {
                        if charactersViewModel.isLoading {
                            ProgressView().progressViewStyle()
                        } else {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(charactersFeatured) { character in
                                    CharactersItemView(character: character)
                                }
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                }.padding(.horizontal, 16)
            }.padding()
            
                .onAppear {
                    Task {
                        charactersFeatured = await charactersViewModel.fetchCharacters(from: episode.characters)
                    }
                }
        }
    }
}

#Preview {
    EpisodeDetailsView(episode: .init(id: 1, name: "Pilot", airDate: "sdasdasd", episode: "S01E01", characters: ["rick","morty"], url: ""), )
        .environmentObject(CharactersViewModel())
}
