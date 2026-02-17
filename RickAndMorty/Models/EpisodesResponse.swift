//
//  Episodes.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

struct EpisodesResponse: Decodable {
    var info: EpisodesInfo
    var results: [Episode]
}

struct EpisodesInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct Episode: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
    var airDate: String
    var episode: String
    var characters: [String]
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
    }
}
