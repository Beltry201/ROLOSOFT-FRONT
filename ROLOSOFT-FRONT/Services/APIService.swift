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
        let endpoint = "/tournaments/\(tournamentId)/matches"
        getRequest(endpoint: endpoint, token: token) { (result: Result<MatchEventResponse, Error>) in
            print("\n-- RESULT MATCHES: ", result)
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

    func searchStudentsAndSchools(tournamentId: String, token: String, query: String, completion: @escaping (Result<(schools: [School], students: [Student]), Error>) -> Void) {
        let endpoint = "/tournaments/\(tournamentId)/search"
        print("\n-- ENDPOINT: ", query)
        getRequest(endpoint: endpoint, token: token) { (result: Result<SearchResponse, Error>) in
            print("\n--RESULT: ", result)
            switch result {
            case .success(let response):
                if response.success {
                    completion(.success((schools: response.data.schools, students: response.data.students)))
                } else {
                    completion(.failure(APIError.noData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


    // Generic GET request method
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

            print("HTTP Status Code: \(httpResponse.statusCode)")

            guard (200...299).contains(httpResponse.statusCode) else {
                print("HTTP Error: \(httpResponse.statusCode)")
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                }
                completion(.failure(APIError.custom("HTTP Error: \(httpResponse.statusCode)")))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Custom date format to match your API response
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let decodedResponse = try decoder.decode(T.self, from: data)
                print("\n-- DECODED DATA: ", decodedResponse)
                completion(.success(decodedResponse))
            } catch {
                print("Decoding error: \(error)")
                let responseString = String(data: data, encoding: .utf8) ?? "Unable to convert data to string."
                print("Response: \(responseString)")
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
    case custom(String)
}

struct SearchResponse: Decodable {
    let success: Bool
    let message: String
    let data: SearchData
}

struct SearchData: Decodable {
    let schools: [School]
    let students: [Student]
}
