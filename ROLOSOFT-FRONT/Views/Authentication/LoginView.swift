//
//  LoginView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 16/04/24.
//
import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @ObservedObject var authService = AuthService()
    @State private var isLogged = false // Boolean to trigger navigation
    @State private var emailErrorMessage: String? = nil
    @State private var passwordErrorMessage: String? = nil

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)

                    TextField("Correo electrónico", text: $username)
                        .modifier(TextFieldModifier())
                        .padding(.bottom, 8)
                    
                    if let emailErrorMessage = emailErrorMessage {
                        Text(emailErrorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(.subheadline)
                    }

                    SecureField("Contraseña", text: $password)
                        .modifier(TextFieldModifier())
                        .padding(.bottom, 8)
                    
                    // Password error message
                    if let passwordErrorMessage = passwordErrorMessage {
                        Text(passwordErrorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(.subheadline)
                    }
                    
                    Button(action: {
                        // Call API service to perform login
                        authService.logIn(username: username, password: password) { result in
                            switch result {
                            case .success(let user):
                                print("Logged in user: \(user.id)")
                            case .failure(let error):
                                switch error {
                                case .unauthorized:
                                    passwordErrorMessage = "Invalid password."
                                    emailErrorMessage = nil
                                case .notFound:
                                    emailErrorMessage = "User not found."
                                    passwordErrorMessage = nil
                                case .clientError, .serverError, .unknown:
                                    break
                                }
                            }
                        }
                    }){
                        Text("Login")
                            .modifier(ButtonModifier())
                    }
                    .padding(.top, 8)
                }
                .padding()
                .navigationTitle("Login")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true) // Hide back button
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
