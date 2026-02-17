//
//  TabBar.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 03.12.25.
//

import SwiftUI

struct TabBar: View {
    
    @StateObject var coordinator = Coordinator()
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(.customBlue)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            NavigationStack(path: $coordinator.charactersPath) {
                CharactersView()
                    .environmentObject(coordinator)
                    .navigationDestination(for: Routes.self) { route in
                        route.view()
                    }
            }
            .tabItem {
                Label("Characters", systemImage: "person.2")
                    .symbolRenderingMode(.hierarchical)
            }
            .tag(0)
            
            NavigationStack(path: $coordinator.episodesPath) {
                EpisodesView()
                    .environmentObject(coordinator)
                    .navigationDestination(for: Routes.self) { route in
                        route.view()
                    }
            }
            .tabItem {
                Label("Episodes", systemImage: "film.stack")
            }
            .tag(1)
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass.circle.fill")
                }
                .tag(2)
            
            LocationsView()
                .tabItem {
                    Label("Locations", systemImage: "location")
                }
                .tag(3)
            
        }.environmentObject(coordinator)
        
    }
}

#Preview {
    TabBar()
        .environmentObject(CharactersViewModel())
        .environmentObject(EpisodesViewModel())
        .environmentObject(LocationsViewModel())
}
