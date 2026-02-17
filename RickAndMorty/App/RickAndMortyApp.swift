//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 03.12.25.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    @StateObject private var charactersViewModel = CharactersViewModel()
    @StateObject private var episodesViewModel = EpisodesViewModel()
    @StateObject private var locationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBar()
                .environmentObject(charactersViewModel)
                .environmentObject(episodesViewModel)
                .environmentObject(locationsViewModel)
        }
    }
}
