//
//  LocationsViewModel.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 06.12.25.
//

import Combine

@MainActor
final class LocationsViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published private(set) var locations: [Location] = []
    @Published private(set) var isLoading = false
    
    private var pageIndex: Int = 1
    private var hasNextPage: Bool = true
    
    //MARK: - Methods
    func loadLocations() async {
        isLoading = true
        do {
            guard let response: LocationsResponse = try await NetworkService.shared.fetchData(from: "\(API.getBaseURL(for: .location))\(pageIndex)")
            else { return }
            
            locations.append(contentsOf: response.results)
            
            if response.info.next != nil {
                hasNextPage = true
            } else {
                hasNextPage = false
            }
            pageIndex += 1
            isLoading = false
        } catch {
            print("Failed to load locations: \(error.localizedDescription)")
            isLoading = false
        }
    }
    
    func shouldLoadPagination(id: Int) async {
        if locations.last?.id == id && hasNextPage {
            await loadLocations()
        }
    }
    
    func refresh() async {
        pageIndex = 1
        locations.removeAll()
        await loadLocations()
    }
}
