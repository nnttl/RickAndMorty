//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 05.12.25.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidStatusCode
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid server response"
        case .invalidStatusCode:
            return "Invalid status code"
        case .decodingError:
            return "Failed to decode data"
        }
    }
}
