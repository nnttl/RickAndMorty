//
//  SearchedCharactersResultsView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 08.12.25.
//

import SwiftUI

struct SearchedCharactersResultsView: View {
    //MARK: - Properties
    var characters: [Character]
    var searchedText: String
    
    //MARK: - Body
    var body: some View {
        
        if characters.isEmpty && !searchedText.isEmpty {
            Text("No characters found")
                .font(.system(size: 18))
                .foregroundStyle(.customGray)
                .padding(.top, 50)
        } else {
            ForEach(characters) { character in
                SearchedCharactersItemView(character: character)
                    .padding(.bottom, 8)
            }
        }
        
    }
}

#Preview {
    SearchView()
}
