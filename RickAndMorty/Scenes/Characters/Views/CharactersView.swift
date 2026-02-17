//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 03.12.25.
//

import SwiftUI

struct CharactersView: View {
    //MARK: - Properties
    @EnvironmentObject var coordinator: Coordinator
    
    @EnvironmentObject var charactersViewModel: CharactersViewModel
    
    @State private var selectedCharacter: Character?
    
    private var gridItemLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    //MARK: - Body
    var body: some View {
        ZStack() {
            CustomBackgroundView()
            
            VStack(spacing: 0) {
                CustomHeaderView(page: .characters)
                
                ScrollView {
                    if charactersViewModel.isLoading {
                        ProgressView().progressViewStyle()
                    } else {
                        LazyVGrid(columns: gridItemLayout, spacing: 16) {
                            ForEach(charactersViewModel.characters) { character in
                                CharactersItemView(character: character)
                                    .onAppear {
                                        Task {
                                            await charactersViewModel.shouldLoadPagination(id: character.id)
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
                .refreshable {
                    Task { await charactersViewModel.refresh() }
                }
            }
        }
        .onAppear {
            Task { await charactersViewModel.loadCharacters() }
        }
    }
}

#Preview {
    //CharactersView()
    TabBar()
        .environmentObject(CharactersViewModel())
        .environmentObject(EpisodesViewModel())
}
