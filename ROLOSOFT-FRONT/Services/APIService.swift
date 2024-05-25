//
//  APIService.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 21/04/24.
//

import Foundation

class APIService: ObservableObject {
    private let baseURL = URL(string: "http://34.125.102.164:3000")
    
    func fetchMatchEvents(tournamentId: String, token: String, completion: @escaping (Result<[MatchEvent], Error>) -> Void) {
        
        // Endpoint for the API request
        let endpoint = "/tournaments/\(tournamentId)/matches"
        
        // Call getRequest method to perform the GET request
        getRequest(endpoint: endpoint, token: token) { (result: Result<MatchEventResponse, Error>) in
            switch result {
            case .success(let response):
                if response.success {
                    completion(.success(response.data))
                } else {
                    completion(.failure(APIError.noData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Generic GET request method (assuming getRequest exists with similar signature)
    private func getRequest<T: Decodable>(endpoint: String, token: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let baseURL = baseURL else {
            completion(.failure(APIError.invalidBaseURL))
            return
        }
        
        let url = baseURL.appendingPathComponent(endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }
                    
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .customISO8601  // Use the custom date decoding strategy
                let decodedResponse = try decoder.decode(T.self, from: data)
                print("\n-- DECODED DATA: ", decodedResponse)
                completion(.success(decodedResponse))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
}

enum APIError: Error {
    case invalidURL
    case noDataStored
    case invalidBaseURL
    case invalidResponse
    case noData
    case decodingError
    case unauthorized
    case notFound
    case serverError
    case custom(String) // You can add custom error messages as needed
}
