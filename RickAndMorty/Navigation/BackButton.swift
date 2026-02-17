//
//  BackButton.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 20)
        }
        .font(.title)
        .foregroundStyle(.white)
    }
}

