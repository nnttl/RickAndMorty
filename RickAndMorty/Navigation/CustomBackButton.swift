//
//  CustomBackButton.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton {
                        coordinator.pop()
                    }
                }
            }
    }
}

extension View {
    func withCustomBackButton() -> some View {
        modifier(BackButtonModifier())
    }
}
