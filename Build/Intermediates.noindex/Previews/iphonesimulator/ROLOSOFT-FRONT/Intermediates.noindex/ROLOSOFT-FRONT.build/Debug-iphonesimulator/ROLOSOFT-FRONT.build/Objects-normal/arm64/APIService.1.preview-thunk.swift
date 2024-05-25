@_private(sourceFile: "APIService.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation

extension APIService {
    @_dynamicReplacement(for: getRequest(endpoint:token:completion:)) private func __preview__getRequest<T: Decodable>(endpoint: String, token: String, completion: @escaping (Result<T, Error>) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/APIService.swift", line: 38)
        guard let baseURL = baseURL else {
            completion(.failure(APIError.invalidBaseURL))
            return
        }
        
        let url = baseURL.appendingPathComponent(endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = __designTimeString("#5422.[1].[2].[3].[0]", fallback: "GET")
        request.setValue(__designTimeString("#5422.[1].[2].[4].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#5422.[1].[2].[4].modifier[0].arg[1].value", fallback: "Content-Type"))
        request.setValue("\(token)", forHTTPHeaderField: __designTimeString("#5422.[1].[2].[5].modifier[0].arg[1].value", fallback: "Authorization"))
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            print("\n-- RESPONSE: ", httpResponse)
            
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }
            
            print("\n-- RAW DATA: ", String(data: data, encoding: .utf8) ?? __designTimeString("#5422.[1].[2].[6].modifier[0].arg[1].value.[4].arg[1].value.[0]", fallback: "No data"))
                    
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                print("\n-- DECODED DATA: ", decodedResponse)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    
#sourceLocation()
    }
}

extension APIService {
    @_dynamicReplacement(for: fetchMatchEvents(tournamentId:token:completion:)) private func __preview__fetchMatchEvents(tournamentId: String, token: String, completion: @escaping (Result<[MatchEvent], Error>) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/APIService.swift", line: 14)
        
        print("\n-- RECIBI JWT:", token)
        print("\n-- RECIBI TID:", tournamentId)
        
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
    
#sourceLocation()
    }
}

import class ROLOSOFT_FRONT.APIService
import enum ROLOSOFT_FRONT.APIError

