//
//  SearchViewModel.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 05.12.25.
//

import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published private(set) var characters: [Character] = []
    @Published private(set) var episodes: [Episode] = []
    @Published private(set) var locations: [Location] = []
    
    @Published private(set) var isLoading = false
    
    
    //MARK: - Methods
    
    func loadSearchedItems(for name: String, selectedSegment: String) async {
        guard !name.isEmpty else {
            clearAll()
            return
        }
        
        isLoading = true
        
        do {
            switch selectedSegment {
            case Segment.Characters.rawValue:
                characters.removeAll()
                guard let response: CharactersResponse = try await NetworkService.shared.fetchData(from: "\(API.searchURLs(resource: Endpoints.character.rawValue, value: name))") else { return }
                characters.append(contentsOf: response.results)
                
            case Segment.Episodes.rawValue:
                episodes.removeAll()
                guard let response: EpisodesResponse = try await NetworkService.shared.fetchData(from: "\(API.searchURLs(resource: Endpoints.episode.rawValue, value: name))")
                else { return }
                
                episodes.append(contentsOf: response.results)
                
            case Segment.Locations.rawValue:
                locations.removeAll()
                guard let response: LocationsResponse = try await NetworkService.shared.fetchData(from: "\(API.searchURLs(resource: Endpoints.location.rawValue, value: name))")
                else { return }
                
                locations.append(contentsOf: response.results)
                
            default:
                break
            }
            
            isLoading = false
        } catch {
            print("Failed to load searched locations")
            isLoading = false
        }
    }
    
    func clearAll() {
        characters.removeAll()
        episodes.removeAll()
        locations.removeAll()
    }
}
