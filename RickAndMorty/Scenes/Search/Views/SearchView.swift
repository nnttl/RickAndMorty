//
//  SearchView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 03.12.25.
//

import SwiftUI

struct SearchView: View {
    
    //MARK: - Properties
    
    @StateObject private var searchViewModel = SearchViewModel()
    
    @State private var text: String = ""
    @State private var selectedSegment = Segment.Characters.rawValue
    
    //MARK: - Body
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                CustomHeaderView(page: .search, searchViewModel: searchViewModel, text: $text, selectedSegment: $selectedSegment)
                    .padding(.bottom, 16)
                
                ScrollView {
                    if searchViewModel.isLoading {
                        ProgressView().progressViewStyle()
                    } else {
                        CustomSegmentedControl(selectedSegment: $selectedSegment)
                            .padding(.bottom, 16)
                        
                        LazyVStack {
                            switch selectedSegment {
                            case Segment.Characters.rawValue:
                                SearchedCharactersResultsView(characters: searchViewModel.characters, searchedText: text)
                                
                            case Segment.Episodes.rawValue:
                                SearchedEpisodesResultsView(episodes: searchViewModel.episodes, searchedText: text)
                                
                            case Segment.Locations.rawValue:
                                SearchedLocationsResultsView(locations: searchViewModel.locations, searchedText: text)
                                
                            default:
                                EmptyView()
                            }
                        }//scrollview
                        
                    }
                }.padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    SearchView()
}
