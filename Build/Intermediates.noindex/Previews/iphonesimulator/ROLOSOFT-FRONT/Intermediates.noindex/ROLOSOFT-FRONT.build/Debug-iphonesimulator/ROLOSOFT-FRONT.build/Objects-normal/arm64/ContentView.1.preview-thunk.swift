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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/ContentView.swift", line: 86)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/ContentView.swift", line: 19)
        // Use ZStack to overlay loading screen over the main content
        ZStack {
            // Main content
            if authService.isAuthenticated {
                TabView(selection: $selectedTab) {
                    HomeView(authService: authService)
                        .navigationBarHidden(__designTimeBoolean("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: true))
                        .tabItem {
                            Image(__designTimeString("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[0].modifier[1].arg[0].value.[0].arg[0].value", fallback: "Home"))
                        }
                        .tag(Tab.home)

                    NavigationView {
                        Text(__designTimeString("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[1].arg[0].value.[0].arg[0].value", fallback: "New articles View"))
                    }
                    .tabItem {
                        Image(__designTimeString("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[1].modifier[0].arg[0].value.[0].arg[0].value", fallback: "News"))
                    }
                    .tag(Tab.news)

                    NavigationView {
                        Text(__designTimeString("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[2].arg[0].value.[0].arg[0].value", fallback: "Teams view"))
                    }
                    .tabItem {
                        Image(__designTimeString("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[2].modifier[0].arg[0].value.[0].arg[0].value", fallback: "Teams"))
                    }
                    .tag(Tab.teams)

                    NavigationView {
                        Text(__designTimeString("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[3].arg[0].value.[0].arg[0].value", fallback: "Search"))
                    }
                    .tabItem {
                        Image(__designTimeString("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[3].modifier[0].arg[0].value.[0].arg[0].value", fallback: "Search"))
                    }
                    .tag(Tab.search)

                    NavigationView {
                        Text(__designTimeString("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[4].arg[0].value.[0].arg[0].value", fallback: "Other View"))
                    }
                    .tabItem {
                        Image(__designTimeString("#4387.[1].[3].property.[0].[0].arg[0].value.[0].[0].[0].arg[1].value.[4].modifier[0].arg[0].value.[0].arg[0].value", fallback: "Profile"))
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
            authService.isLoading = __designTimeBoolean("#4387.[1].[3].property.[0].[0].modifier[0].arg[1].value.[0].[0]", fallback: false)
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

