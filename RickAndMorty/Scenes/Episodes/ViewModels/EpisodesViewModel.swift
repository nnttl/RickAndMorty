//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 05.12.25.
//

import Combine

@MainActor
final class EpisodesViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published private(set) var episodes: [Episode] = []
    @Published private(set) var isLoading = false
    
    private var pageIndex: Int = 1
    private var hasNextPage: Bool = true
    
    //MARK: - Methods
    func loadEpisodes() async {
        isLoading = true
        do {
            guard let response: EpisodesResponse = try await NetworkService.shared.fetchData(from: "\(API.getBaseURL(for: .episode))\(pageIndex)")
            else { return }
            episodes.append(contentsOf: response.results)
            
            if response.info.next != nil {
                hasNextPage = true
            } else {
                hasNextPage = false
            }
            pageIndex += 1
            isLoading = false
        } catch {
            print("Failed to load episodes: \(error.localizedDescription)")
            isLoading = false
        }
    }
    
    func shouldLoadPagination(id: Int) async {
        if episodes.last?.id == id && hasNextPage {
            await loadEpisodes()
        }
    }
    
    func refresh() async {
        pageIndex = 1
        episodes.removeAll()
        
        await loadEpisodes()
    }
    
    //
    func fetchEpisodes(from urls: [String]) async -> [Episode] {
        var charactersInEpisodes: [Episode] = []
        
        for url in urls {
            do {
                let episode: Episode =  try await NetworkService.shared.fetchData(from: url)
                charactersInEpisodes.append(episode)
            }  catch {
                print("Failed to fetch episode from \(url): \(error.localizedDescription)")
            }
        }
        return charactersInEpisodes
    }
}
