//
//  LocationsResponse.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 06.12.25.
//


struct LocationsResponse: Decodable {
    var info: LocationsInfo
    var results: [Location]
}

struct LocationsInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct Location: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
}
