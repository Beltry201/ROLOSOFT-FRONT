@_private(sourceFile: "ContentView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/ContentView.swift", line: 82)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/ContentView.swift", line: 20)
        // Use ZStack to overlay loading screen over the main content
        ZStack {
            // Main content
            if authService.isAuthenticated {
                TabView(selection: $selectedTab) {
                    HomeView(authService: authService, apiService: apiSerive)
                        .navigationBarHidden(__designTimeBoolean("#5580.[1].[4].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: true))
                        .tabItem {
                            Image(__designTimeString("#5580.[1].[4].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[0].modifier[1].arg[0].value.[0].arg[0].value", fallback: "Home"))
                        }
                        .tag(Tab.home)

                    NavigationView {
                        Text(__designTimeString("#5580.[1].[4].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[1].arg[0].value.[0].arg[0].value", fallback: "New articles View"))
                    }
                    .tabItem {
                        Image(__designTimeString("#5580.[1].[4].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[1].modifier[0].arg[0].value.[0].arg[0].value", fallback: "News"))
                    }
                    .tag(Tab.news)

                    NavigationView {
                        Text(__designTimeString("#5580.[1].[4].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[2].arg[0].value.[0].arg[0].value", fallback: "Teams view"))
                    }
                    .tabItem {
                        Image(__designTimeString("#5580.[1].[4].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[2].modifier[0].arg[0].value.[0].arg[0].value", fallback: "Teams"))
                    }
                    .tag(Tab.teams)

                    SearchView()
                    .tabItem {
                        Image(__designTimeString("#5580.[1].[4].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[3].modifier[0].arg[0].value.[0].arg[0].value", fallback: "Search"))
                    }
                    .tag(Tab.search)
                    
                    ProfileView(authService: authService)
                    .tabItem {
                        Image(__designTimeString("#5580.[1].[4].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[4].modifier[0].arg[0].value.[0].arg[0].value", fallback: "Profile"))
                    }
                    .tag(Tab.profile)
                }
                .accentColor(.red)
            } else {
                LoginView(authService: authService)
            }
            
            // Loading screen
            if authService.isLoading {
            }
        }
        // Reset isLoading when authentication status changes
        .onChange(of: authService.isAuthenticated) { newValue, oldValue in
            authService.isLoading = __designTimeBoolean("#5580.[1].[4].property.[0].[0].modifier[0].arg[1].value.[0].[0]", fallback: false)
        }
        .onAppear {
            // Check authentication status when ContentView appears
            authService.checkAuthentication()
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ContentView
import struct ROLOSOFT_FRONT.ContentView_Previews

