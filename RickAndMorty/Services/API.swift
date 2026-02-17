//
//  API.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 05.12.25.
//

import Foundation

enum Endpoints: String {
    case character
    case episode
    case location
}

struct API {
    static private let locationBaseURL = "https://rickandmortyapi.com/api/location"
    
    static private let baseURL = "https://rickandmortyapi.com/api"
    
    static func getBaseURL(for type: Endpoints) -> String {
        "https://rickandmortyapi.com/api/\(type)?page="
    }
    
    static func searchURLs<T: Decodable>(resource: T, key: String = "name", value: String) throws -> String {
        guard let encodedValue = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw URLError(.badURL) }
        return "\(baseURL)/\(resource)?\(key)=\(encodedValue)"
    }
}
