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
        // Use ZStack to overlay loading screen over the main content
        ZStack {
            // Main content
            if authService.isAuthenticated {
                NavigationView {
                    HomeView(authService: authService) // Pass authService to HomeView
                }
            } else {
                LoginView(authService: authService)
            }
            
            // Loading screen
            if authService.isLoading {
                LoadingView()
            }
        }
        // Reset isLoading when authentication status changes
        .onChange(of: authService.isAuthenticated) { newValue in
            authService.isLoading = false
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
