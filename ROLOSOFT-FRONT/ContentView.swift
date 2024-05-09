//
//  ContentView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 15/04/24.
//

import SwiftUI
struct ContentView: View {
    @StateObject var authService = AuthService()
    @State private var isLoading = true // Add a state to track loading status
    
    var body: some View {
        // Use ZStack to overlay loading screen over the main content
        ZStack {
            if isLoading {
                // Loading screen
                LoadingView()
                    .onAppear {
                        // Perform authentication check when ContentView appears
                        authService.checkAuthentication { isAuthenticated in 
                            // Update isLoading state based on authentication result
                            isLoading = false
                        }
                    }
            } else {
                // Main content
                Group {
                    if authService.isAuthenticated {
                        HomeView()
                    } else {
                        LoginView(authService: authService)
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
