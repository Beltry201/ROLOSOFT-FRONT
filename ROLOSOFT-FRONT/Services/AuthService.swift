//
//  AuthService.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 23/04/24.
//

import Foundation

class AuthService: ObservableObject {
    private let baseURL = URL(string: "https://9072-131-178-102-72.ngrok-free.app")
    @Published var isAuthenticated = false
    
    func logIn(username: String, password: String, completion: @escaping (User) -> Void) {
        print("HOLA")
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
                    DispatchQueue.main.async {
                        completion(user)
                        self.isAuthenticated = true
                    }
                } else {
                    print("Invalid response format")
                }
            } catch {
                print("Error parsing JSON:", error.localizedDescription)
            }
        }.resume()
    }
    
    func checkAuthentication() {
            // Check if the user is already authenticated (e.g., via stored tokens, session, etc.)
            // Update isAuthenticated accordingly
            isAuthenticated = false // For demonstration purposes; replace with actual logic
        }
    
}

