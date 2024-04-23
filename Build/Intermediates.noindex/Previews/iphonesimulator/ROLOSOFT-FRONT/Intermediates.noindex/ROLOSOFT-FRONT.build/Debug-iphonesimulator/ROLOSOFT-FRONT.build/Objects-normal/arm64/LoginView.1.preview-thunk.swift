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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Authentication/LoginView.swift", line: 59)
        LoginView()
    
#sourceLocation()
    }
}

extension LoginView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Authentication/LoginView.swift", line: 16)
        NavigationView {
            VStack {
                Text(__designTimeString("#1413.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Login"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, __designTimeInteger("#1413.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: 20))

                TextField(__designTimeString("#1413.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "Username"), text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)

                SecureField(__designTimeString("#1413.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[2].arg[0].value", fallback: "Password"), text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    // Call API service to perform login
                    authService.logIn(username: username, password: password) { user in
                        print("Logged in user: \(user)")
                    }
                }) {
                    Text(__designTimeString("#1413.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[1].value.[0].arg[0].value", fallback: "Login"))
                        .frame(minWidth: __designTimeInteger("#1413.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[1].value.[0].modifier[0].arg[0].value", fallback: 0), maxWidth: .infinity)
                        .frame(height: __designTimeInteger("#1413.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[1].value.[0].modifier[1].arg[0].value", fallback: 50))
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(__designTimeInteger("#1413.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[1].value.[0].modifier[4].arg[0].value", fallback: 10))
                        .padding()
                }

                Spacer()
            }
            .padding()
            .navigationTitle(__designTimeString("#1413.[1].[4].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: "Login"))
            .navigationBarHidden(__designTimeBoolean("#1413.[1].[4].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: true))
            .navigationBarBackButtonHidden(__designTimeBoolean("#1413.[1].[4].property.[0].[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: true)) // Hide back button
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.LoginView
import struct ROLOSOFT_FRONT.LoginView_Previews

