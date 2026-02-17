//
//  LocationsView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 06.12.25.
//

import SwiftUI

struct LocationsView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    //MARK: - Body
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                CustomHeaderView(page: .locations)
                
                ScrollView {
                    if locationsViewModel.isLoading {
                        ProgressView().progressViewStyle()
                    } else {
                        LazyVStack {
                            ForEach(locationsViewModel.locations) { location in
                                LocationsItemView(location: location)
                                    .padding(.bottom, 8)
                                    .onAppear {
                                        Task { await locationsViewModel.shouldLoadPagination(id: location.id) }
                                    }
                            }
                        }.padding()
                    }
                }
            }
            .onAppear {
                Task { await locationsViewModel.loadLocations() }
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
