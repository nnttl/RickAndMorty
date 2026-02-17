//
//  SearchedEpisodesResultsView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 08.12.25.
//

import SwiftUI

struct SearchedEpisodesResultsView: View {
    
    //MARK: - Properties
    var episodes: [Episode]
    var searchedText: String
    
    //MARK: - Body
    var body: some View {
        if episodes.isEmpty && !searchedText.isEmpty {
            Text("No episodes found")
                .font(.system(size: 18))
                .foregroundStyle(.customGray)
                .padding(.top, 50)
        } else {
            ForEach(episodes) { episode in
                EpisodesItemView(episode: episode)
                    .padding(.bottom, 8)
            }
        }
    }
}

#Preview {
    SearchView()
}
