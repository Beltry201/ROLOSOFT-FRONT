//
//  ContentView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 15/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authService = AuthService()
    @State private var selectedTab: Tab = .home // Keep track of the selected tab

    enum Tab {
        case home, news, teams, search, profile
    }

    var body: some View {
        // Use ZStack to overlay loading screen over the main content
        ZStack {
            // Main content
            if authService.isAuthenticated {
                TabView(selection: $selectedTab) {
                    HomeView(authService: authService)
                        .navigationBarHidden(true)
                        .tabItem {
                            Image("Home")
                        }
                        .tag(Tab.home)

                    NavigationView {
                        Text("New articles View")
                    }
                    .tabItem {
                        Image("News")
                    }
                    .tag(Tab.news)

                    NavigationView {
                        Text("Teams view")
                    }
                    .tabItem {
                        Image("Teams")
                    }
                    .tag(Tab.teams)

                    NavigationView {
                        Text("Search")
                    }
                    .tabItem {
                        Image("Search")
                    }
                    .tag(Tab.search)

                    NavigationView {
                        Text("Other View")
                    }
                    .tabItem {
                        Image("Profile")
                    }
                    .tag(Tab.profile)
                }
                .accentColor(.red)
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
        .onAppear {
            // Check authentication status when ContentView appears
            authService.checkAuthentication()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
