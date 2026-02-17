//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 05.12.25.
//

import Combine

@MainActor
final class CharactersViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published private(set) var characters: [Character] = []
    
    @Published private(set) var isLoading = false
    
    private var pageIndex: Int = 1
    private var hasNextPage: Bool = true
    
    //MARK: - Methods
    func loadCharacters() async {
        isLoading = true
        do {
            guard let response: CharactersResponse = try await NetworkService.shared.fetchData(from: "\(API.getBaseURL(for: .character))\(pageIndex)")
            else { return }
            
            characters.append(contentsOf: response.results )
            
            if response.info.next != nil {
                hasNextPage = true
            } else {
                hasNextPage = false
            }
            pageIndex += 1
            isLoading = false
        } catch {
            print("Failed to load characters: \(error.localizedDescription)")
            isLoading = false
        }
    }
    
    
    func shouldLoadPagination(id: Int) async {
        if characters.last?.id == id && hasNextPage {
            await loadCharacters()
        }
    }
    
    func refresh() async {
        pageIndex = 1
        characters.removeAll()
        await loadCharacters()
    }
    
    //characters featured in episode
    func fetchCharacters(from urls: [String]) async -> [Character] {
        isLoading = true
        var charactersFeatured: [Character] = []
        
        for url in urls {
            do {
                let character: Character =  try await NetworkService.shared.fetchData(from: url)
                charactersFeatured.append(character)
                isLoading = false
            }  catch {
                print("Failed to fetch character from \(url): \(error.localizedDescription)")
                isLoading = false
            }
        }
        return charactersFeatured
    }
}
