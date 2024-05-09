@_private(sourceFile: "ContentView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/ContentView.swift", line: 14)
        // Use ZStack to overlay loading screen over the main content
        ZStack {
            if isLoading {
                // Loading screen
                LoadingView()
                    .onAppear {
                        // Perform authentication check when ContentView appears
                        authService.checkAuthentication { isAuthenticated in 
                            // Update isLoading state based on authentication result
                            isLoading = __designTimeBoolean("#7992.[1].[2].property.[0].[0].arg[0].value.[0].[0].[0].modifier[0].arg[0].value.[0].modifier[0].arg[0].value.[0].[0]", fallback: false)
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
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ContentView
#Preview {
    ContentView()
}



