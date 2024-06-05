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
    @State private var generalErrorMessage: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Image("frisa-logox4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 224)
                    .clipped()
                    .padding(.bottom, 48)
                
                
                    Text("Correo electrónico")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom, 0)
                    
                    TextField("Correo electrónico", text: $username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    if let emailErrorMessage = emailErrorMessage {
                        Text(emailErrorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.top, 2)
                            .font(.subheadline)
                    }

                    Text("Contraseña")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top, 16)
                    
                    SecureField("Contraseña", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Password error message
                    if let passwordErrorMessage = passwordErrorMessage {
                        Text(passwordErrorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.top, 2)
                            .font(.subheadline)
                    }
                    
                    if let generalErrorMessage = generalErrorMessage {
                        Text(generalErrorMessage)
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
                                case .custom(let message):
                                    generalErrorMessage = message
                                    emailErrorMessage = nil
                                    passwordErrorMessage = nil
                                case .clientError, .serverError, .unknown:
                                    break
                                }
                            }
                        }
                    }){
                        Text("Iniciar sesión")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.906, green: 0.078, blue: 0.161))
                            .cornerRadius(8)
                    }
                    .padding(.top, 48)
                
            }
            .padding()
            .navigationTitle("Login")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true) // Hide back button
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
