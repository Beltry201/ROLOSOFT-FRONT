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

    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    // Call API service to perform login
                    authService.logIn(username: username, password: password) { user in
                        print("Logged in user: \(user.id)")
                    }
                }) {
                    Text("Login")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Login")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true) // Hide back button
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
