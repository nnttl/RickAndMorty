//
//  EpisodesItemView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 05.12.25.
//

import SwiftUI

struct EpisodesItemView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var coordinator: Coordinator
    var episode: Episode
    
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            Button(action: {
                coordinator.goToEpisodeDetailsView(for: episode)
            }) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.customBlue.opacity(0.7))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(episode.episode)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.white)
                
                Text(episode.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                
                Text(episode.airDate)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.white)
                
            }.padding()
        }
    }
}

#Preview {
    EpisodesView()
        .environmentObject(EpisodesViewModel())
        .environmentObject(Coordinator())
}
