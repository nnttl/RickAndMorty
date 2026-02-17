//
//  SearchedLocationsResultsView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 08.12.25.
//

import SwiftUI

struct SearchedLocationsResultsView: View {
    
    //MARK: - Properties
    var locations: [Location]
    var searchedText: String
    
    //MARK: - Body
    var body: some View {
        if locations.isEmpty && !searchedText.isEmpty {
            Text("No locations found")
                .font(.system(size: 18))
                .foregroundStyle(.customGray)
                .padding(.top, 50)
        } else {
            ForEach(locations) { locations in
                LocationsItemView(location: locations)
                    .padding(.bottom, 8)
            }
        }
    }
}

#Preview {
    SearchView()
}
