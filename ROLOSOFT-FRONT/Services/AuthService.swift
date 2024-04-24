//
//  AuthService.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 23/04/24.
//

import Foundation

class AuthService: ObservableObject {
    private let baseURL = URL(string: "https://e6fe-131-178-102-220.ngrok-free.app")
    private let jwtTokenKey = ""
    
    @Published var isAuthenticated = false
    
    
    func logIn(username: String, password: String, completion: @escaping (User) -> Void) {
        
        guard let baseURL = baseURL else {
            print("Invalid base URL")
            return
        }
        
        let url = baseURL.appendingPathComponent("/users/login")
        
        let body: [String: Any] = [
            "email": username,
            "password": password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            print("Error converting body to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            switch httpResponse.statusCode {
            case 200..<300: // Successful response
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let success = jsonResponse?["success"] as? Bool, success {
                        // If "success" is true, proceed to fetch data
                        if let dataDict = jsonResponse?["data"] as? [String: Any],
                           let userIdString = dataDict["userId"] as? String,
                           let jwt = dataDict["token"] as? String,
                           let userId = UUID(uuidString: userIdString) {
                            
                            // Store JWT token in UserDefaults
                            UserDefaults.standard.set(jwt, forKey: self.jwtTokenKey)
                            
                            // Create user model using fetched data
                            let user = User(id: userId, email: username, jwt: jwt)
                            
                            DispatchQueue.main.async {
                                completion(user)
                                self.isAuthenticated = true
                            }
                        } else {
                            print("Invalid data format")
                        }
                    } else {
                        print("Login failed")
                    }
                } catch {
                    print("Error parsing JSON:", error.localizedDescription)
                }
                
            case 400..<500: // Client error
                print("Login failed with status code:", httpResponse.statusCode)
                // Handle client error, if needed
                
            case 500..<600: // Server error
                print("Server error:", httpResponse.statusCode)
                // Handle server error, if needed
                
            default:
                print("Unexpected status code:", httpResponse.statusCode)
                // Handle unexpected status code, if needed
            }
        }.resume()
    }
    
    func checkAuthentication() {
        print("Checking authentication")
        // Check if JWT token exists in UserDefaults
        if let jwt = UserDefaults.standard.string(forKey: jwtTokenKey) {
            print("Token found: ",jwt)
            validateToken(jwt: jwt)
        } else {
            isAuthenticated = false
        }
    }
    
    private func validateToken(jwt: String) {
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
                return
            }
            
            switch httpResponse.statusCode {
            case 200..<300: // Token is valid
                self.isAuthenticated = true
                print("Token is valid")
            default: // Token is invalid
                self.isAuthenticated = false
                print("Token is invalid")
            }
        }.resume()
    }
}
