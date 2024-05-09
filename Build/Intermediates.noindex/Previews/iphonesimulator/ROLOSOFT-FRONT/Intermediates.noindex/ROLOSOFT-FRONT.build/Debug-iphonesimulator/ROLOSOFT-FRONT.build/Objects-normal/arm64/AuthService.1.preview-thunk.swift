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
    @_dynamicReplacement(for: checkAuthentication()) private func __preview__checkAuthentication() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 89)
        // Check if the user is already authenticated (e.g., via stored tokens, session, etc.)
        // Update isAuthenticated accordingly
        isAuthenticated = __designTimeBoolean("#10058.[1].[3].[0].[0]", fallback: false) // For demonstration purposes; replace with actual logic
    
#sourceLocation()
    }
}

extension AuthService {
    @_dynamicReplacement(for: logIn(username:password:completion:)) private func __preview__logIn(username: String, password: String, completion: @escaping (User) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/AuthService.swift", line: 15)
        print(__designTimeString("#10058.[1].[2].[0].arg[0].value", fallback: "HOLA"))
        guard let baseURL = baseURL else {
            print("Invalid base URL")
            return
        }
        
        let url = baseURL.appendingPathComponent(__designTimeString("#10058.[1].[2].[2].value.modifier[0].arg[0].value", fallback: "/users/login"))
        
        let body: [String: Any] = [
            __designTimeString("#10058.[1].[2].[3].value.[0].key", fallback: "email"): username,
            __designTimeString("#10058.[1].[2].[3].value.[1].key", fallback: "password"): password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            print("Error converting body to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = __designTimeString("#10058.[1].[2].[6].[0]", fallback: "POST")
        request.setValue(__designTimeString("#10058.[1].[2].[7].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#10058.[1].[2].[7].modifier[0].arg[1].value", fallback: "Content-Type"))
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
                            
                            // Create user model using fetched data
                            let user = User(id: userId, email: username, jwt: jwt)
                            
                            DispatchQueue.main.async {
                                completion(user)
                                self.isAuthenticated = true
                            }
                            print("is auth? ", self.isAuthenticated)
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
                print(__designTimeString("#10058.[1].[2].[9].modifier[0].arg[1].value.[1].[1].[0].arg[0].value", fallback: "Login failed with status code:"), httpResponse.statusCode)
                // Handle client error, if needed
                
            case 500..<600: // Server error
                print(__designTimeString("#10058.[1].[2].[9].modifier[0].arg[1].value.[1].[2].[0].arg[0].value", fallback: "Server error:"), httpResponse.statusCode)
                // Handle server error, if needed
                
            default:
                print(__designTimeString("#10058.[1].[2].[9].modifier[0].arg[1].value.[1].[3].[0].arg[0].value", fallback: "Unexpected status code:"), httpResponse.statusCode)
                // Handle unexpected status code, if needed
            }
        }.resume()
    
#sourceLocation()
    }
}

import class ROLOSOFT_FRONT.AuthService

