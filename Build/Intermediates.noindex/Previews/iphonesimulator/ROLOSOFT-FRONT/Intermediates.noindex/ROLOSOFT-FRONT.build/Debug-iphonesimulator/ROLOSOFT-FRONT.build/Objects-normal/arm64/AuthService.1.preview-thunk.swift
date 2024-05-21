@_private(sourceFile: "AuthService.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation

extension AuthService {
    @_dynamicReplacement(for: validateToken(jwt:completion:)) private func __preview__validateToken(jwt: String, completion: @escaping (Bool) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 264)
        // Construct the URL for the token validation endpoint using the base URL
        guard let baseURL = baseURL,
              let url = URL(string: "/users/validate-token", relativeTo: baseURL) else {
            print("Invalid base URL or endpoint")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = __designTimeString("#7810.[1].[10].[2].[0]", fallback: "GET")
        request.setValue(__designTimeString("#7810.[1].[10].[3].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#7810.[1].[10].[3].modifier[0].arg[1].value", fallback: "Content-Type"))
        request.setValue("Bearer \(jwt)", forHTTPHeaderField: __designTimeString("#7810.[1].[10].[4].modifier[0].arg[1].value", fallback: "Authorization"))
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            guard let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error:", error?.localizedDescription ?? "Unknown error")
                completion(false) // Call the completion handler with false if there's an error
                return
            }
            
            switch httpResponse.statusCode {
            case 200..<300: // Token is valid
                print(__designTimeString("#7810.[1].[10].[5].modifier[0].arg[1].value.[1].[0].[0].arg[0].value", fallback: "Token is valid"))
                completion(__designTimeBoolean("#7810.[1].[10].[5].modifier[0].arg[1].value.[1].[0].[1].arg[0].value", fallback: true)) // Call the completion handler with true
            default: // Token is invalid
                print(__designTimeString("#7810.[1].[10].[5].modifier[0].arg[1].value.[1].[1].[0].arg[0].value", fallback: "Token is invalid"))
                completion(__designTimeBoolean("#7810.[1].[10].[5].modifier[0].arg[1].value.[1].[1].[1].arg[0].value", fallback: false)) // Call the completion handler with false
            }
        }.resume()
    
#sourceLocation()
    }
}

extension AuthService {
    @_dynamicReplacement(for: logOut()) private func __preview__logOut() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 253)
        // Remove JWT from UserDefaults
        UserDefaults.standard.removeObject(forKey: jwtTokenKey)
        
        // Update authentication status
        self.isAuthenticated = __designTimeBoolean("#7810.[1].[9].[1].[0]", fallback: false)
        self.userProfile = nil
        
        print(__designTimeString("#7810.[1].[9].[3].arg[0].value", fallback: "Logged out"))
    
#sourceLocation()
    }
}

extension AuthService {
    @_dynamicReplacement(for: checkAuthentication()) private func __preview__checkAuthentication() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 209)
        print(__designTimeString("#7810.[1].[8].[0].arg[0].value", fallback: "Checking authentication"))
        // Set loading state to true
        DispatchQueue.main.async {
            self.isLoading = __designTimeBoolean("#7810.[1].[8].[1].modifier[0].arg[0].value.[0].[0]", fallback: true)
        }
        
        // Check if JWT token exists in UserDefaults
        if let jwt = UserDefaults.standard.string(forKey: jwtTokenKey) {
            print(__designTimeString("#7810.[1].[8].[2].[0].[0].arg[0].value", fallback: "Token found: "), jwt)
            validateToken(jwt: jwt) { isValid in
                if isValid {
                    self.fetchUserProfile(jwt: jwt) { result in
                        switch result {
                        case .success(let profile):
                            self.userProfile = profile
                            DispatchQueue.main.async {
                                self.isAuthenticated = __designTimeBoolean("#7810.[1].[8].[2].[0].[1].arg[1].value.[0].[0].[0].modifier[0].arg[1].value.[0].[0].[1].modifier[0].arg[0].value.[0].[0]", fallback: true)
                                self.isLoading = __designTimeBoolean("#7810.[1].[8].[2].[0].[1].arg[1].value.[0].[0].[0].modifier[0].arg[1].value.[0].[0].[1].modifier[0].arg[0].value.[1].[0]", fallback: false)
                            }
                        case .failure:
                            DispatchQueue.main.async {
                                self.isAuthenticated = __designTimeBoolean("#7810.[1].[8].[2].[0].[1].arg[1].value.[0].[0].[0].modifier[0].arg[1].value.[0].[1].[0].modifier[0].arg[0].value.[0].[0]", fallback: false)
                                self.isLoading = __designTimeBoolean("#7810.[1].[8].[2].[0].[1].arg[1].value.[0].[0].[0].modifier[0].arg[1].value.[0].[1].[0].modifier[0].arg[0].value.[1].[0]", fallback: false)
                            }
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.isAuthenticated = __designTimeBoolean("#7810.[1].[8].[2].[0].[1].arg[1].value.[0].[1].[0].modifier[0].arg[0].value.[0].[0]", fallback: false)
                        self.isLoading = __designTimeBoolean("#7810.[1].[8].[2].[0].[1].arg[1].value.[0].[1].[0].modifier[0].arg[0].value.[1].[0]", fallback: false)
                    }
                }
            }
        } else {
            print(__designTimeString("#7810.[1].[8].[2].[1].[0].arg[0].value", fallback: "No token found"))
            // Set authentication status and loading state on the main thread
            DispatchQueue.main.async {
                self.isAuthenticated = __designTimeBoolean("#7810.[1].[8].[2].[1].[1].modifier[0].arg[0].value.[0].[0]", fallback: false)
                self.isLoading = __designTimeBoolean("#7810.[1].[8].[2].[1].[1].modifier[0].arg[0].value.[1].[0]", fallback: false)
            }
        }
    
#sourceLocation()
    }
}

extension AuthService {
    @_dynamicReplacement(for: fetchUserProfile(jwt:completion:)) private func __preview__fetchUserProfile(jwt: String, completion: @escaping (Result<UserProfile, UserError>) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 144)
        guard let baseURL = baseURL,
              let url = URL(string: "/users/myself", relativeTo: baseURL) else {
            print("Invalid base URL or endpoint")
            completion(.failure(.unknown))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = __designTimeString("#7810.[1].[7].[2].[0]", fallback: "GET")
        request.setValue(__designTimeString("#7810.[1].[7].[3].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#7810.[1].[7].[3].modifier[0].arg[1].value", fallback: "Content-Type"))
        request.setValue("\(jwt)", forHTTPHeaderField: __designTimeString("#7810.[1].[7].[4].modifier[0].arg[1].value", fallback: "Authorization"))
        
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
                print(__designTimeString("#7810.[1].[7].[5].modifier[0].arg[1].value.[2].[1].[1].arg[0].value", fallback: "401 Unauthorized"))
                
            case 404: // Not Found
                print("Profile not found: \(httpResponse.statusCode)")
                completion(.failure(.notFound))
                
            case 500..<600: // Server error
                print(__designTimeString("#7810.[1].[7].[5].modifier[0].arg[1].value.[2].[3].[0].arg[0].value", fallback: "Server error:"), httpResponse.statusCode)
                completion(.failure(.serverError))
                
            default:
                completion(.failure(.unknown))
            }
        }.resume()
    
#sourceLocation()
    }
}

extension AuthService {
    @_dynamicReplacement(for: logIn(username:password:completion:)) private func __preview__logIn(username: String, password: String, completion: @escaping (LoginResult) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 24)
        guard let baseURL = baseURL else {
            print("Invalid base URL")
            completion(.failure(.unknown))
            return
        }
        
        let url = baseURL.appendingPathComponent(__designTimeString("#7810.[1].[6].[1].value.modifier[0].arg[0].value", fallback: "/users/login"))
        
        let body: [String: Any] = [
            __designTimeString("#7810.[1].[6].[2].value.[0].key", fallback: "email"): username,
            __designTimeString("#7810.[1].[6].[2].value.[1].key", fallback: "password"): password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            print("Error converting body to JSON data")
            completion(.failure(.serverError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = __designTimeString("#7810.[1].[6].[5].[0]", fallback: "POST")
        request.setValue(__designTimeString("#7810.[1].[6].[6].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#7810.[1].[6].[6].modifier[0].arg[1].value", fallback: "Content-Type"))
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
                          let jwt = dataDict["token"] as? String else {
                        print("Invalid data format")
                        completion(.failure(.unknown))
                        return
                    }
                    
                    // Store JWT token in UserDefaults
                    UserDefaults.standard.set(jwt, forKey: self.jwtTokenKey)
                    
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
                print(__designTimeString("#7810.[1].[6].[8].modifier[0].arg[1].value.[2].[1].[1].arg[0].value", fallback: "401 Unauthorized"))
                
            case 404: // Not Found
                print("User not found: \(httpResponse.statusCode)")
                completion(.failure(.notFound))
                
            case 403: // Client error with custom message
                print("Client error: \(httpResponse.statusCode)")
                completion(.failure(.custom(__designTimeString("#7810.[1].[6].[8].modifier[0].arg[1].value.[2].[3].[1].arg[0].value.arg[0].value.arg[0].value", fallback: "Este usuario no puede ingresar a la app"))))
                
            case 400..<500: // Client error
                print("Client error: \(httpResponse.statusCode)")
                if let data = data {
                    if String(data: data, encoding: .utf8) != nil {
                        completion(.failure(.unknown))
                    } else {
                        completion(.failure(.unknown))
                    }
                } else {
                    print(__designTimeString("#7810.[1].[6].[8].modifier[0].arg[1].value.[2].[4].[1].[1].[0].arg[0].value", fallback: "Data is nil"))
                    completion(.failure(.unknown))
                }
                
            case 500..<600: // Server error
                print(__designTimeString("#7810.[1].[6].[8].modifier[0].arg[1].value.[2].[5].[0].arg[0].value", fallback: "Server error:"), httpResponse.statusCode)
                completion(.failure(.serverError))
                
            default:
                completion(.failure(.unknown))
            }
        }.resume()
    
#sourceLocation()
    }
}

import class ROLOSOFT_FRONT.AuthService

