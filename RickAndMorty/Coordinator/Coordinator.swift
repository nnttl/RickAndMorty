//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

import SwiftUI

final class Coordinator: ObservableObject {
    
    //MARK: - Properties
    @Published var charactersPath: NavigationPath = NavigationPath()
    @Published var episodesPath: NavigationPath = NavigationPath()
    
    @Published var routes: Routes?
    @Published var selectedTab: Int = 0
    
    //MARK: - Methods
    func push(page: Routes) {
        charactersPath.append(page)
    }
    
    func pop() {
        switch selectedTab {
        case 0:
            charactersPath.removeLast()
        case 1:
            episodesPath.removeLast()
        default:
            break
        }
    }
    
    func goToCharacterDetailsView(for character: Character) {
        charactersPath.append(Routes.characterDetails(selectedCharacter: character))
    }
    
    func goToEpisodeDetailsView(for episode: Episode) {
        episodesPath.append(Routes.episodeDetails(selectedEpisode: episode))
    }
}
