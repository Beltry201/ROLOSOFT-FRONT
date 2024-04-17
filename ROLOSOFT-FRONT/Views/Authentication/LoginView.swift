//
//  LoginView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 16/04/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                // Handle login button tap
                self.login()
            }) {
                Text("Login")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
            .disabled(isLoading) // Disable the button when loading

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Spacer()
        }
        .padding()
    }

    private func login() {
        // Show loading indicator
        isLoading = true
        errorMessage = ""

        // Call API service to perform login
        APIService.login(email: email, password: password) { result in
            isLoading = false

            switch result {
            case .success(let user):
                // Handle successful login (e.g., save user session, navigate to home screen)
                print("Login successful for user: \(user)")
            case .failure(let error):
                // Handle login failure (e.g., display error message)
                errorMessage = error.localizedDescription
                print("Login failed: \(error.localizedDescription)")
            }
        }
    }
}

// Mock API Service for demonstration
struct APIService {
    static func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Simulate API call (replace with actual API call)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if email == "Test@example.com" && password == "password" {
                let user = User(id: UUID(), email: email) // Mock user
                completion(.success(user))
            } else {
                completion(.failure(LoginError.invalidCredentials))
            }
        }
    }
}

struct User {
    let id: UUID
    let email: String
}

enum LoginError: Error {
    case invalidCredentials
}

#Preview {
    LoginView()
}
