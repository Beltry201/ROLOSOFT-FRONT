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
            .navigationTitle(authService.isAuthenticated ? __designTimeString("#11595.[1].[1].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.then", fallback: "Home") : __designTimeString("#11595.[1].[1].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.else", fallback: "Login"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ContentView
#Preview {
    ContentView()
}



