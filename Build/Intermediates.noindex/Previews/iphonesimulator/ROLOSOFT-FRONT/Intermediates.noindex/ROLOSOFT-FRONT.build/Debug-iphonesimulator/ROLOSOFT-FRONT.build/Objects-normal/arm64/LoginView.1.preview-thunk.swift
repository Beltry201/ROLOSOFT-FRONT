@_private(sourceFile: "LoginView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension LoginView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Authentication/LoginView.swift", line: 91)
        LoginView()
    
#sourceLocation()
    }
}

extension LoginView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Authentication/LoginView.swift", line: 18)
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    Text(__designTimeString("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Login"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, __designTimeInteger("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[1].value", fallback: 20))

                    TextField(__designTimeString("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value", fallback: "Correo electrónico"), text: $username)
                        .modifier(TextFieldModifier())
                        .padding(.bottom, __designTimeInteger("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].modifier[1].arg[1].value", fallback: 8))
                    
                    if let emailErrorMessage = emailErrorMessage {
                        Text(emailErrorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(.subheadline)
                    }

                    SecureField(__designTimeString("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[3].arg[0].value", fallback: "Contraseña"), text: $password)
                        .modifier(TextFieldModifier())
                        .padding(.bottom, __designTimeInteger("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[3].modifier[1].arg[1].value", fallback: 8))
                    
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
                                    passwordErrorMessage = __designTimeString("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[5].arg[0].value.[0].modifier[0].arg[2].value.[0].[1].[0].[0].[0].[0]", fallback: "Invalid password.")
                                    emailErrorMessage = nil
                                case .notFound:
                                    emailErrorMessage = __designTimeString("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[5].arg[0].value.[0].modifier[0].arg[2].value.[0].[1].[0].[1].[0].[0]", fallback: "User not found.")
                                    passwordErrorMessage = nil
                                case .clientError, .serverError, .unknown:
                                    break
                                }
                            }
                        }
                    }){
                        Text(__designTimeString("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[5].arg[1].value.[0].arg[0].value", fallback: "Login"))
                            .modifier(ButtonModifier())
                    }
                    .padding(.top, __designTimeInteger("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[5].modifier[0].arg[1].value", fallback: 8))
                }
                .padding()
                .navigationTitle(__designTimeString("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: "Login"))
                .navigationBarHidden(__designTimeBoolean("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: true))
                .navigationBarBackButtonHidden(__designTimeBoolean("#8783.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[3].arg[0].value", fallback: true)) // Hide back button
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
            }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.LoginView
import struct ROLOSOFT_FRONT.LoginView_Previews

