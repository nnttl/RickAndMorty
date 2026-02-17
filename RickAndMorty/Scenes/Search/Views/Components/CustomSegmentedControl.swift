//
//  CustomSegmentedControl.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

import SwiftUI

enum Segment: String {
    case Characters
    case Episodes
    case Locations
}

struct CustomSegmentedControl: View {
    
    //MARK: - Properties
    
    private let segments: [String] = [Segment.Characters.rawValue, Segment.Episodes.rawValue, Segment.Locations.rawValue]
    @Binding var selectedSegment: String
    @Namespace var name //
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments, id: \.self) { segment in
                Button {
                    selectedSegment = segment
                } label: {
                    VStack {
                        Text(segment)
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(selectedSegment == segment ? .white : .customGray)
                        ZStack {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 2)
                            if selectedSegment == segment {
                                Capsule()
                                    .fill(Color.white)
                                    .frame(height: 2)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(EpisodesViewModel())
}

