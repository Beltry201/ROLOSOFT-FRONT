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
    @_dynamicReplacement(for: logIn(username:password:completion:)) private func __preview__logIn(username: String, password: String, completion: @escaping (User) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Services/APIService.swift", line: 15)
        print(__designTimeString("#1436.[1].[2].[0].arg[0].value", fallback: "HOLA"))
        guard let baseURL = baseURL else {
            print("Invalid base URL")
            return
        }
        
        let url = baseURL.appendingPathComponent(__designTimeString("#1436.[1].[2].[2].value.modifier[0].arg[0].value", fallback: "/users/login"))
        
        let body: [String: Any] = [
            __designTimeString("#1436.[1].[2].[3].value.[0].key", fallback: "email"): username,
            __designTimeString("#1436.[1].[2].[3].value.[1].key", fallback: "password"): password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            print("Error converting body to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = __designTimeString("#1436.[1].[2].[6].[0]", fallback: "POST")
        request.setValue(__designTimeString("#1436.[1].[2].[7].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#1436.[1].[2].[7].modifier[0].arg[1].value", fallback: "Content-Type"))
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print("Error:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard (200..<300).contains(response.statusCode) else {
                print("Login failed with status code:", response.statusCode)
                return
            }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let message = jsonResponse?["message"] as? String,
                   let userIdString = jsonResponse?["id"] as? String,
                   let userId = UUID(uuidString: userIdString) {
                    print("Login successful: \(message), User ID: \(userId)")
                    let user = User(id: userId, email: username)
                    completion(user)
                    
                    // Navigate to the menu page here
                    // You can trigger navigation based on your app's navigation setup
                } else {
                    print("Invalid response format")
                }
            } catch {
                print("Error parsing JSON:", error.localizedDescription)
            }
        }.resume()
    
#sourceLocation()
    }
}

import class ROLOSOFT_FRONT.APIService

