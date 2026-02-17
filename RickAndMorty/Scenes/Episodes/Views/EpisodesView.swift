//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 03.12.25.
//

import SwiftUI

struct EpisodesView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var episodesViewModel: EpisodesViewModel
    
    private var columns: [GridItem] = [ GridItem(.flexible())]
    
    //MARK: - Body
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                CustomHeaderView(page: .episodes)
                ScrollView {
                    if episodesViewModel.isLoading {
                        ProgressView().progressViewStyle()
                    } else {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(episodesViewModel.episodes) { episode in
                                EpisodesItemView(episode: episode)
                                    .onAppear {
                                        Task {
                                            await episodesViewModel.shouldLoadPagination(id: episode.id)
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
                .refreshable {
                    Task { await episodesViewModel.refresh() }
                }
            }
        }
        .onAppear {
            Task { await episodesViewModel.loadEpisodes() }
        }
    }
}

#Preview {
    EpisodesView()
        .environmentObject(EpisodesViewModel())
}
