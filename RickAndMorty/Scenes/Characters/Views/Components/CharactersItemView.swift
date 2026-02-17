//
//  CharactersItemView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 06.12.25.
//

import SwiftUI

struct CharactersItemView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var coordinator: Coordinator
    var character: Character
    
    //MARK: - Body
    var body: some View {
        VStack {
            ZStack {
                Button(action: {
                    coordinator.goToCharacterDetailsView(for: character)
                }) {
                    makeButtonContent(for: character)
                }
            }
        }
    }
    
    //MARK: - Methods
    
    func makeButtonContent(for character: Character) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.customBlue.opacity(0.7))
            
            VStack(spacing: 12) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .frame(width: 125 , height: 125)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                        .padding(.top, 4)
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .foregroundStyle(Color.customGray)
                        .frame(width: 125 , height: 125)
                }
                
                Text("\(character.name)")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    CharactersView()
        .environmentObject(CharactersViewModel())
        .environmentObject(Coordinator())
}
