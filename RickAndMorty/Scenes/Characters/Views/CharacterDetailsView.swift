//
//  CharacterDetailsView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    //MARK: - Properties
    @EnvironmentObject var episodesViewModel: EpisodesViewModel
    
    @State private var characterEpisodes: [Episode] = []
    
    var character: Character
    let rows = [GridItem(.fixed(50))]
    
    
    //MARK: - Body
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.customBlue.opacity(0.7))
                    .frame(height: 570)
                
                VStack(spacing: 8) {
                    
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .frame(width: 125 , height: 125)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.top, 4)
                            .padding(.bottom, 8)
                        
                    } placeholder: {
                        Image(systemName: "photo")
                            .foregroundStyle(Color.customGray)
                            .frame(width: 125 , height: 125)
                    }
                    
                    Text(character.name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.bottom, 16)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Gender")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Text(character.gender)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.white)
                            .padding(.bottom, 8)
                        
                        Text("Status")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Text(character.status)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.white)
                            .padding(.bottom, 8)
                        
                        Text("Species")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Text(character.species)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.white)
                            .padding(.bottom, 8)
                        
                        Text("Origin")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Text(character.origin.name)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.white)
                            .padding(.bottom, 8)
                        
                        Text("Appears In")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(characterEpisodes) { episode in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.clear)
                                            .stroke(Color.white)
                                            .frame(height: 30)
                                        
                                        Text(episode.episode)
                                            .font(.system(size: 16, weight: .regular))
                                            .foregroundStyle(.white)
                                            .padding()
                                    }
                                }
                            }
                            .frame(height: 35)
                            .padding(.horizontal, 4)
                        }
                        
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                }
                .padding(.vertical, 16)
                
            }.padding(.horizontal, 24)
            
        }
        .onAppear {
            Task {
                characterEpisodes = await episodesViewModel.fetchEpisodes(from: character.episode)
            }
        }
    }
}

#Preview {
    TabBar()
        .environmentObject(CharactersViewModel())
        .environmentObject(EpisodesViewModel())
}
