//
//  LocationsItemView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 06.12.25.
//

import SwiftUI

struct LocationsItemView: View {
    
    //MARK: - Properties
    var location: Location
    
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            Button(action: {}) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.customBlue.opacity(0.7))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(location.name)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Text(location.type)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.white)
                        
                        Text(location.dimension)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    
                    Image(systemName: "location")
                        .foregroundStyle(Color.customGray)
                }
                
            }.padding()
        }
    }
}

#Preview {
    //LocationsItemView()
    LocationsView()
        .environmentObject(LocationsViewModel())
}
