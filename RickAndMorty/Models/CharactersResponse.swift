//
//  Characters.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 04.12.25.
//

struct CharactersResponse: Decodable {
    var info: InfoCharacters
    var results: [Character]
}

struct InfoCharacters: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct Character: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: LocationURLs
    var image: String
    var episode: [String]
    var url: String
}

struct Origin: Decodable, Hashable {
    var name: String
    var url: String
}

struct LocationURLs: Decodable, Hashable {
    var name: String
    var url: String
}
