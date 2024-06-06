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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/APIService.swift", line: 97)
        guard let baseURL = baseURL else {
            completion(.failure(APIError.invalidBaseURL))
            return
        }

        let url = baseURL.appendingPathComponent(endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = __designTimeString("#6363.[1].[6].[3].[0]", fallback: "GET")
        request.setValue(__designTimeString("#6363.[1].[6].[4].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#6363.[1].[6].[4].modifier[0].arg[1].value", fallback: "Content-Type"))
        request.setValue("\(token)", forHTTPHeaderField: __designTimeString("#6363.[1].[6].[5].modifier[0].arg[1].value", fallback: "Authorization"))

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
    
#sourceLocation()
    }
}

extension APIService {
    @_dynamicReplacement(for: searchStudentsAndSchools(tournamentId:token:query:completion:)) private func __preview__searchStudentsAndSchools(tournamentId: String, token: String, query: String, completion: @escaping (Result<(schools: [School], students: [Student]), Error>) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/APIService.swift", line: 79)
        let endpoint = "/tournaments/\(tournamentId)/search"
        getRequest(endpoint: endpoint, token: token) { (result: Result<SearchResponse, Error>) in
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
    
#sourceLocation()
    }
}

extension APIService {
    @_dynamicReplacement(for: fetchMatchEvents(tournamentId:token:completion:)) private func __preview__fetchMatchEvents(tournamentId: String, token: String, completion: @escaping (Result<[MatchEvent], Error>) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/APIService.swift", line: 63)
        let endpoint = "/tournaments/\(tournamentId)/matches"
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

extension APIService {
    @_dynamicReplacement(for: fetchLeaderBoard(tournamentId:token:completion:)) private func __preview__fetchLeaderBoard(tournamentId: String, token: String, completion: @escaping (Result<[LeaderBoardTeamData], Error>) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/APIService.swift", line: 47)
        let endpoint = "/tournaments/\(tournamentId)/general-table"
        getRequest(endpoint: endpoint, token: token) { (result: Result<LeaderBoardResponse, Error>) in
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

extension APIService {
    @_dynamicReplacement(for: fetchScoringTable(tournamentId:token:completion:)) private func __preview__fetchScoringTable(tournamentId: String, token: String, completion: @escaping (Result<[ScoringTableRow], Error>) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/APIService.swift", line: 31)
        let endpoint = "/tournaments/\(tournamentId)/scoring-table"
        getRequest(endpoint: endpoint, token: token) { (result: Result<ScoringTableResponse, Error>) in
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

extension APIService {
    @_dynamicReplacement(for: fetchTeamDetails(tournamentId:teamId:token:completion:)) private func __preview__fetchTeamDetails(tournamentId: String, teamId: String,  token: String, completion: @escaping (Result<TeamDetails, Error>) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/APIService.swift", line: 14)
        let endpoint = "/tournaments/\(tournamentId)/schools/\(teamId)/general-table"
        getRequest(endpoint: endpoint, token: token) { (result: Result<TeamDetailsResponse, Error>) in
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

