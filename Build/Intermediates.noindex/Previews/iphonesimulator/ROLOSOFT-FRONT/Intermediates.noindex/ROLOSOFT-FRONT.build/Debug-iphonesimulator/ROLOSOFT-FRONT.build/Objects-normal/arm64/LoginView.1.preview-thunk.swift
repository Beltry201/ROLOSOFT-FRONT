@_private(sourceFile: "LoginView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation
import SwiftUI

extension APIService {
    @_dynamicReplacement(for: login(email:password:completion:)) private static func __preview__login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Authentication/LoginView.swift", line: 81)
        // Simulate API call (replace with actual API call)
        DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeInteger("#191.[3].[0].[0].modifier[0].arg[0].value.[0]", fallback: 2)) {
            if email == "test@example.com" && password == "password" {
                let user = User(id: UUID(), email: email) // Mock user
                completion(.success(user))
            } else {
                completion(.failure(LoginError.invalidCredentials))
            }
        }
    
#sourceLocation()
    }
}

extension LoginView {
    @_dynamicReplacement(for: login()) private func __preview__login() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Authentication/LoginView.swift", line: 57)
        // Show loading indicator
        isLoading = __designTimeBoolean("#191.[2].[5].[0].[0]", fallback: true)
        errorMessage = __designTimeString("#191.[2].[5].[1].[0]", fallback: "")

        // Call API service to perform login
        APIService.login(email: email, password: password) { result in
            isLoading = __designTimeBoolean("#191.[2].[5].[2].arg[2].value.[0].[0]", fallback: false)

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
    
#sourceLocation()
    }
}

extension LoginView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Authentication/LoginView.swift", line: 18)
        VStack {
            Text(__designTimeString("#191.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Login"))
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, __designTimeInteger("#191.[2].[4].property.[0].[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: 20))

            TextField(__designTimeString("#191.[2].[4].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Email"), text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField(__designTimeString("#191.[2].[4].property.[0].[0].arg[0].value.[2].arg[0].value", fallback: "Password"), text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                // Handle login button tap
                self.login()
            }) {
                Text(__designTimeString("#191.[2].[4].property.[0].[0].arg[0].value.[3].arg[1].value.[0].arg[0].value", fallback: "Login"))
                    .frame(minWidth: __designTimeInteger("#191.[2].[4].property.[0].[0].arg[0].value.[3].arg[1].value.[0].modifier[0].arg[0].value", fallback: 0), maxWidth: .infinity)
                    .frame(height: __designTimeInteger("#191.[2].[4].property.[0].[0].arg[0].value.[3].arg[1].value.[0].modifier[1].arg[0].value", fallback: 50))
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(__designTimeInteger("#191.[2].[4].property.[0].[0].arg[0].value.[3].arg[1].value.[0].modifier[4].arg[0].value", fallback: 10))
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
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.LoginView
import struct ROLOSOFT_FRONT.APIService
import struct ROLOSOFT_FRONT.User
import enum ROLOSOFT_FRONT.LoginError
#Preview {
    LoginView()
}



