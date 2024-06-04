//
//  AuthService.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 23/04/24.
//

import Foundation

class AuthService: ObservableObject {
    private let baseURL = URL(string: "http://34.118.243.66:3000")
    public let jwtTokenKey = "jwtToken"
    public let tournamentIdKey = "tournamentId"
    public let teamIdKey = "teamId"
    
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var userProfile: UserProfile? = nil
    
    enum LoginResult {
        case success(UserProfile)
        case failure(UserError)
    }

    func logIn(username: String, password: String, completion: @escaping (LoginResult) -> Void) {
        guard let baseURL = baseURL else {
            print("Invalid base URL")
            completion(.failure(.unknown))
            return
        }
        
        let url = baseURL.appendingPathComponent("/users/login")
        
        let body: [String: Any] = [
            "email": username,
            "password": password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            print("Error converting body to JSON data")
            completion(.failure(.serverError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            print(httpResponse.statusCode)
            switch httpResponse.statusCode {
            case 200..<300: // Successful response
                do {
                    guard let data = data else {
                        print("Data is nil")
                        completion(.failure(.unknown))
                        return
                    }
                    
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    guard let jsonResponse = jsonResponse else {
                        print("Failed to parse JSON response")
                        completion(.failure(.unknown))
                        return
                    }
                    
                    guard let success = jsonResponse["success"] as? Bool, success else {
                        print("Login failed")
                        completion(.failure(.unknown))
                        return
                    }
                    
                    guard let dataDict = jsonResponse["data"] as? [String: Any],
                          let jwt = dataDict["token"] as? String,
                          let teamId = dataDict["schoolId"] as? String,
                          let tournamentId = dataDict["tournamentId"] as? String else {
                            print("Invalid data format")
                            completion(.failure(.unknown))
                            return
                       }
                       
                    // Store JWT token and tournament ID in UserDefaults
                    UserDefaults.standard.set(jwt, forKey: self.jwtTokenKey)
                    UserDefaults.standard.set(teamId, forKey: self.teamIdKey)
                    UserDefaults.standard.set(tournamentId, forKey: self.tournamentIdKey)
                    
                    // Fetch user profile
                    self.fetchUserProfile(jwt: jwt) { result in
                        switch result {
                        case .success(let profile):
                            self.userProfile = profile
                            DispatchQueue.main.async {
                                completion(.success(profile))
                                self.isAuthenticated = true
                            }
                        case .failure(let error):
                            DispatchQueue.main.async {
                                completion(.failure(error))
                            }
                        }
                    }
                    
                } catch {
                    print("Error parsing JSON:", error.localizedDescription)
                    completion(.failure(.unknown))
                }

            case 401: // Unauthorized
                completion(.failure(.unauthorized))
                print("401 Unauthorized")
                
            case 404: // Not Found
                print("User not found: \(httpResponse.statusCode)")
                completion(.failure(.notFound))
                
            case 403: // Client error with custom message
                print("Client error: \(httpResponse.statusCode)")
                completion(.failure(.custom("Este usuario no puede ingresar a la app")))
                
            case 400..<500: // Client error
                print("Client error: \(httpResponse.statusCode)")
                if let data = data {
                    if String(data: data, encoding: .utf8) != nil {
                        completion(.failure(.unknown))
                    } else {
                        completion(.failure(.unknown))
                    }
                } else {
                    print("Data is nil")
                    completion(.failure(.unknown))
                }
                
            case 500..<600: // Server error
                print("Server error:", httpResponse.statusCode)
                completion(.failure(.serverError))
                
            default:
                completion(.failure(.unknown))
            }
        }.resume()
    }
    
    private func fetchUserProfile(jwt: String, completion: @escaping (Result<UserProfile, UserError>) -> Void) {
        guard let baseURL = baseURL,
              let url = URL(string: "/users/myself", relativeTo: baseURL) else {
            print("Invalid base URL or endpoint")
            completion(.failure(.unknown))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(jwt)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            print(httpResponse.statusCode)
            switch httpResponse.statusCode {
            case 200..<300: // Successful response
                do {
                    guard let data = data else {
                        print("Data is nil")
                        completion(.failure(.unknown))
                        return
                    }
                    
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    guard let jsonResponse = jsonResponse,
                          let success = jsonResponse["success"] as? Bool, success,
                          let dataDict = jsonResponse["data"] as? [String: Any] else {
                        completion(.failure(.unknown))
                        return
                    }
                    
                    let userProfile = try JSONDecoder().decode(UserProfile.self, from: JSONSerialization.data(withJSONObject: dataDict, options: []))
                    print(userProfile)
                    DispatchQueue.main.async {
                        completion(.success(userProfile))
                    }
                } catch {
                    print("Error parsing JSON:", error.localizedDescription)
                    completion(.failure(.unknown))
                }

            case 401: // Unauthorized
                completion(.failure(.unauthorized))
                print("401 Unauthorized")
                
            case 404: // Not Found
                print("Profile not found: \(httpResponse.statusCode)")
                completion(.failure(.notFound))
                
            case 500..<600: // Server error
                print("Server error:", httpResponse.statusCode)
                completion(.failure(.serverError))
                
            default:
                completion(.failure(.unknown))
            }
        }.resume()
    }
    
    func checkAuthentication() {
        print("Checking authentication")
        // Set loading state to true
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        // Check if JWT token exists in UserDefaults
        if let jwt = UserDefaults.standard.string(forKey: jwtTokenKey) {
            print("Token found: ", jwt)
            validateToken(jwt: jwt) { isValid in
                if isValid {
                    self.fetchUserProfile(jwt: jwt) { result in
                        switch result {
                        case .success(let profile):
                            self.userProfile = profile
                            DispatchQueue.main.async {
                                self.isAuthenticated = true
                                self.isLoading = false
                            }
                        case .failure:
                            DispatchQueue.main.async {
                                self.isAuthenticated = false
                                self.isLoading = false
                            }
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.isAuthenticated = false
                        self.isLoading = false
                    }
                }
            }
        } else {
            print("No token found")
            // Set authentication status and loading state on the main thread
            DispatchQueue.main.async {
                self.isAuthenticated = false
                self.isLoading = false
            }
        }
    }
    
    func logOut() {
        // Remove JWT from UserDefaults
        UserDefaults.standard.removeObject(forKey: jwtTokenKey)
        
        // Update authentication status
        self.isAuthenticated = false
        self.userProfile = nil
        
        print("Logged out")
    }
    
    private func validateToken(jwt: String, completion: @escaping (Bool) -> Void) {
        // Construct the URL for the token validation endpoint using the base URL
        guard let baseURL = baseURL,
              let url = URL(string: "/users/validate-token", relativeTo: baseURL) else {
            print("Invalid base URL or endpoint")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(jwt)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            guard let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error:", error?.localizedDescription ?? "Unknown error")
                completion(false) // Call the completion handler with false if there's an error
                return
            }
            
            switch httpResponse.statusCode {
            case 200..<300: // Token is valid
                print("Token is valid")
                completion(true) // Call the completion handler with true
            default: // Token is invalid
                print("Token is invalid")
                completion(false) // Call the completion handler with false
            }
        }.resume()
    }
}
