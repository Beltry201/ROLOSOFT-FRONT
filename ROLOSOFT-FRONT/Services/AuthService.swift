//
//  AuthService.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 23/04/24.
//

import Foundation

class AuthService: ObservableObject {
    private let baseURL = URL(string: "http://34.125.102.164:3000")
    private let jwtTokenKey = ""
    
    @Published var isAuthenticated = false
    @Published var isLoading = false
    
    enum LoginResult {
        case success(User)
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
            
            switch httpResponse.statusCode {
            case 200..<300: // Successful response
                do {
                    guard let data = data else {
                        print("Data is nil")
                        completion(.failure(UserError.unknown))
                        return
                    }
                    
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    guard let jsonResponse = jsonResponse else {
                        print("Failed to parse JSON response")
                        completion(.failure(UserError.unknown))
                        return
                    }
                    
                    guard let success = jsonResponse["success"] as? Bool, success else {
                        print("Login failed")
                        completion(.failure(UserError.unknown))
                        return
                    }
                    
                    guard let dataDict = jsonResponse["data"] as? [String: Any],
                          let userIdString = dataDict["userId"] as? String,
                          let jwt = dataDict["token"] as? String,
                          let userId = UUID(uuidString: userIdString) else {
                        print("Invalid data format")
                        completion(.failure(UserError.unknown))
                        return
                    }
                    
                    // Store JWT token in UserDefaults
                    UserDefaults.standard.set(jwt, forKey: self.jwtTokenKey)
                    
                    // Create user model using fetched data
                    let user = User(id: userId, email: username, jwt: jwt)
                    
                    DispatchQueue.main.async {
                        completion(.success(user))
                        self.isAuthenticated = true
                    }
                    
                } catch {
                    print("Error parsing JSON:", error.localizedDescription)
                    completion(.failure(UserError.unknown))
                }

            case 401: // Unauthorized
                completion(.failure(.unauthorized))
                print("401")

                
            case 404: // Not Found
                print("User not found: \(httpResponse.statusCode)")
                completion(.failure(.notFound))
                
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
                completion(.failure(UserError(rawValue: httpResponse.statusCode) ?? .unknown))
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
                // Set authentication status and loading state on the main thread
                DispatchQueue.main.async {
                    self.isAuthenticated = isValid
                    self.isLoading = false
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
        UserDefaults.standard.removeObject(forKey: "jwtToken")
        
        // Update authentication status
        self.isAuthenticated = false
        
        print("Logged out")
    }
    
    private func validateToken(jwt: String, completion: @escaping (Bool) -> Void) {
        // Construct the URL for the token validation endpoint using the base URL
        guard let baseURL = baseURL,
              let url = URL(string: "/users/validate-token", relativeTo: baseURL) else {
            print("Invalid base URL or endpoint")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(jwt)", forHTTPHeaderField: "Authorization")
        
        // Send the request
        URLSession.shared.dataTask(with: request) { _, response, error in
            guard let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error:", error?.localizedDescription ?? "Unknown error")
                completion(false) // Call the completion handler with false if there's an error
                return
            }
            
            switch httpResponse.statusCode {
            case 200..<300: // Token is valid
                self.isAuthenticated = true
                print("Token is valid")
                completion(true) // Call the completion handler with true
            default: // Token is invalid
                self.isAuthenticated = false
                print("Token is invalid")
                completion(false) // Call the completion handler with false
            }
        }.resume()
    }
}
