//
//  CustomProgressViewModifier.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 08.12.25.
//

import SwiftUI

struct CustomProgressViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            content
                .tint(.customGray)
                .scaleEffect(1.5)
                .padding(.top, 100)
        }.frame(maxWidth: .infinity)
    }
}

extension View {
    func progressViewStyle() -> some View {
        self.modifier(CustomProgressViewModifier())
    }
}
