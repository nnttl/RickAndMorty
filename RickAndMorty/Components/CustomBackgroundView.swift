//
//  CustomBackgroundView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

import SwiftUI

struct CustomBackgroundView: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            Color.customBackground
        }
    }
}

#Preview {
    CustomBackgroundView()
}
