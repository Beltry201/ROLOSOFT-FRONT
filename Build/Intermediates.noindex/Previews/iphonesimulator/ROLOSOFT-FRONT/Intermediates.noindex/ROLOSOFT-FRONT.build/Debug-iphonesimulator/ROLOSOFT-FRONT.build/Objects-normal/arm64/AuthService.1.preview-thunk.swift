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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 155)
        // Construct the URL for the token validation endpoint using the base URL
        guard let baseURL = baseURL,
              let url = URL(string: "/users/validate-token", relativeTo: baseURL) else {
            print("Invalid base URL or endpoint")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = __designTimeString("#9082.[1].[7].[2].[0]", fallback: "GET")
        request.setValue(__designTimeString("#9082.[1].[7].[3].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#9082.[1].[7].[3].modifier[0].arg[1].value", fallback: "Content-Type"))
        request.setValue("\(jwt)", forHTTPHeaderField: __designTimeString("#9082.[1].[7].[4].modifier[0].arg[1].value", fallback: "Authorization"))
        
        // Send the request
        URLSession.shared.dataTask(with: request) { _, response, error in
            guard let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error:", error?.localizedDescription ?? "Unknown error")
                completion(false) // Call the completion handler with false if there's an error
                return
            }
            
            switch httpResponse.statusCode {
            case 200..<300: // Token is valid
                self.isAuthenticated = __designTimeBoolean("#9082.[1].[7].[5].modifier[0].arg[1].value.[1].[0].[0].[0]", fallback: true)
                print(__designTimeString("#9082.[1].[7].[5].modifier[0].arg[1].value.[1].[0].[1].arg[0].value", fallback: "Token is valid"))
                completion(__designTimeBoolean("#9082.[1].[7].[5].modifier[0].arg[1].value.[1].[0].[2].arg[0].value", fallback: true)) // Call the completion handler with true
            default: // Token is invalid
                self.isAuthenticated = __designTimeBoolean("#9082.[1].[7].[5].modifier[0].arg[1].value.[1].[1].[0].[0]", fallback: false)
                print(__designTimeString("#9082.[1].[7].[5].modifier[0].arg[1].value.[1].[1].[1].arg[0].value", fallback: "Token is invalid"))
                completion(__designTimeBoolean("#9082.[1].[7].[5].modifier[0].arg[1].value.[1].[1].[2].arg[0].value", fallback: false)) // Call the completion handler with false
            }
        }.resume()
    
#sourceLocation()
    }
}

extension AuthService {
    @_dynamicReplacement(for: logOut()) private func __preview__logOut() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 147)
        // Remove JWT from UserDefaults
        UserDefaults.standard.removeObject(forKey: __designTimeString("#9082.[1].[6].[0].modifier[0].arg[0].value", fallback: "jwtToken"))
        
        // Update authentication status
        isAuthenticated = __designTimeBoolean("#9082.[1].[6].[1].[0]", fallback: false)
    
#sourceLocation()
    }
}

extension AuthService {
    @_dynamicReplacement(for: checkAuthentication(completion:)) private func __preview__checkAuthentication(completion: @escaping (Bool) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 131)
        print(__designTimeString("#9082.[1].[5].[0].arg[0].value", fallback: "Checking authentication"))
        // Check if JWT token exists in UserDefaults
        if let jwt = UserDefaults.standard.string(forKey: jwtTokenKey) {
            print(__designTimeString("#9082.[1].[5].[1].[0].[0].arg[0].value", fallback: "Token found: "), jwt)
            validateToken(jwt: jwt) { isValid in
                // Call the completion handler with the authentication status
                completion(isValid)
            }
        } else {
            isAuthenticated = __designTimeBoolean("#9082.[1].[5].[1].[1].[0].[0]", fallback: false)
            // Call the completion handler with the authentication status
            completion(__designTimeBoolean("#9082.[1].[5].[1].[1].[1].arg[0].value", fallback: false))
        }
    
#sourceLocation()
    }
}

extension AuthService {
    @_dynamicReplacement(for: logIn(username:password:completion:)) private func __preview__logIn(username: String, password: String, completion: @escaping (LoginResult) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 22)
        guard let baseURL = baseURL else {
            print("Invalid base URL")
            completion(.failure(.unknown))
            return
        }
        
        let url = baseURL.appendingPathComponent(__designTimeString("#9082.[1].[4].[1].value.modifier[0].arg[0].value", fallback: "/users/login"))
        
        let body: [String: Any] = [
            __designTimeString("#9082.[1].[4].[2].value.[0].key", fallback: "email"): username,
            __designTimeString("#9082.[1].[4].[2].value.[1].key", fallback: "password"): password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            print("Error converting body to JSON data")
            completion(.failure(.serverError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = __designTimeString("#9082.[1].[4].[5].[0]", fallback: "POST")
        request.setValue(__designTimeString("#9082.[1].[4].[6].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#9082.[1].[4].[6].modifier[0].arg[1].value", fallback: "Content-Type"))
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
                    }
                } catch {
                    print("Error parsing JSON:", error.localizedDescription)
                    completion(.failure(UserError.unknown))
                }

            case 401: // Unauthorized
                completion(.failure(.unauthorized))
                print(__designTimeString("#9082.[1].[4].[8].modifier[0].arg[1].value.[1].[1].[1].arg[0].value", fallback: "401"))

                
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
                    print(__designTimeString("#9082.[1].[4].[8].modifier[0].arg[1].value.[1].[3].[1].[1].[0].arg[0].value", fallback: "Data is nil"))
                    completion(.failure(.unknown))
                }
                
            case 500..<600: // Server error
                print(__designTimeString("#9082.[1].[4].[8].modifier[0].arg[1].value.[1].[4].[0].arg[0].value", fallback: "Server error:"), httpResponse.statusCode)
                completion(.failure(.serverError))
                
            default:
                completion(.failure(UserError(rawValue: httpResponse.statusCode) ?? .unknown))
            }
        }.resume()
    
#sourceLocation()
    }
}

import class ROLOSOFT_FRONT.AuthService

