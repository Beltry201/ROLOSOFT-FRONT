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
            HStack {
                Image(systemName: "person.crop.circle.fill.badge.xmark")
                    .foregroundColor(.red)
                Text("Cerrar sesión")
                    .foregroundColor(.red)
                    .padding()
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
        }
    }
}

#Preview {
    let authService = AuthService()
    return LogoutButton(authService: authService)
}
