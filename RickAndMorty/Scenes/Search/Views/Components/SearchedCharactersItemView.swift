//
//  SearchedCharactersItemView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 06.12.25.
//

import SwiftUI

struct SearchedCharactersItemView: View {
    
    //MARK: - Properties
    var character: Character
    
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            Button(action: {}) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.customBlue.opacity(0.7))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 16) {
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
                    VStack(alignment: .leading, spacing: 8) {
                        Text(character.name)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                        
                        Text("Status: \(character.status)")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.white)
                        
                        Text("Species: \(character.species)")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.white)
                        
                        Text("Gender: \(character.gender)")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.white)
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    SearchView()
}
