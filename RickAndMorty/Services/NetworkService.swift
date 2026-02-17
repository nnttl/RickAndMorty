//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 05.12.25.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchData<T: Decodable>(from url: String) async throws -> T {
        guard let url = URL(string: url) else { throw NetworkError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }
        guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.invalidStatusCode }
        guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.decodingError }
        return decodedResponse
    }
}
