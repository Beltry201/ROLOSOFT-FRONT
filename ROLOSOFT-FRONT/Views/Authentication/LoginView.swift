//
//  LoginView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 16/04/24.
//
import SwiftUI

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @ObservedObject var authService = AuthService()
    @State private var isLogged = false // Boolean to trigger navigation
    @State private var emailErrorMessage: String? = "Error"
    @State private var passwordErrorMessage: String? = "Error"

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
                    
                    // Email error message
                    if let emailErrorMessage = emailErrorMessage {
                        Text(emailErrorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(.subheadline)
                    }

                    SecureField("Contraseña", text: $password)
                        .modifier(TextFieldModifier())
                    
                    if let passwordErrorMessage = passwordErrorMessage {
                        Text(passwordErrorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(.subheadline)
                    }
                    
                    Button(action: {
                        // Call API service to perform login
                        authService.logIn(username: username, password: password) { user in
                            print("Logged in user: \(user.id)")
                        }
                    }) {
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
