//
//  LogOutButton.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 17/05/24.
//

import SwiftUI

struct LogoutButton: View {
    @ObservedObject var authService: AuthService // Add authService as an observed object
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            authService.logOut() // Call logOut method from AuthService
            presentationMode.wrappedValue.dismiss() // Dismiss the current view
        }) {
            Text("Cerrar sesión")
                .foregroundColor(.red)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    let authService = AuthService()
    return LogoutButton(authService: authService)
}
