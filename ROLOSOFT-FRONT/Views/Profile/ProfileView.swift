//
//  ProfileView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 16/05/24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var authService: AuthService
    // Example user data structure
    struct User {
        var name: String
        var email: String
        var phoneNumber: String
        // You can add more fields as needed
    }
    
    // Example user data (replace with actual data fetched from API)
    @State private var user: User = User(name: "John Doe", email: "john.doe@example.com", phoneNumber: "+1234567890")
    
    var body: some View {
        VStack {
            // User icon (replace with actual icon)
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                .frame(width: 50, height: 50)
            
            
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(user.phoneNumber)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10) // Adjust as needed
            }
            .padding(20)
            LogoutButton(authService: authService)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let authService = AuthService()
        ProfileView(authService: authService)
    }
}
