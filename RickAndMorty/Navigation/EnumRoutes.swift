//
//  EnumRoutes.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

import SwiftUI

enum Routes: Hashable {
    case characters
    case characterDetails(selectedCharacter: Character)
    case episodes
    case episodeDetails(selectedEpisode: Episode)
    case search
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .characters:
            CharactersView()
        case .characterDetails(let character):
            CharacterDetailsView(character: character)
                .withCustomBackButton()
        case .episodes:
            EpisodesView()
        case .episodeDetails(let episode):
            EpisodeDetailsView(episode: episode)
                .withCustomBackButton()
        case .search:
            SearchView()
        }
    }
}
