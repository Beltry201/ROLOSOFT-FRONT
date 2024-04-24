//
//  ContentView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 15/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authService = AuthService()
    
    var body: some View {
        NavigationView {
            Group {
                if authService.isAuthenticated {
                    HomeView()
                } else {
                    LoginView(authService: authService)
                }
            }
            .onAppear {
                // Check authentication status when ContentView appears
                authService.checkAuthentication()
            }
            .navigationTitle(authService.isAuthenticated ? "Home" : "Login")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
#Preview {
    ContentView()
}
