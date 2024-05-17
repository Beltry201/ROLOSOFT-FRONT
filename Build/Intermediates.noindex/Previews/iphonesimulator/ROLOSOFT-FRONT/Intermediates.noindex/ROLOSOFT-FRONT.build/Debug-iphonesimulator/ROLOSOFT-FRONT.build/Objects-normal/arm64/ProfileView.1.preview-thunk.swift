@_private(sourceFile: "ProfileView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ProfileView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Profile/ProfileView.swift", line: 55)
        let authService = AuthService()
        ProfileView(authService: authService)
    
#sourceLocation()
    }
}

extension ProfileView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Profile/ProfileView.swift", line: 24)
        VStack {
            // User icon (replace with actual icon)
            HStack {
                Image(systemName: __designTimeString("#7811.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "person.circle"))
                    .resizable()
                .frame(width: __designTimeInteger("#7811.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 50), height: __designTimeInteger("#7811.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: 50))
            
            
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
                .padding(.leading, __designTimeInteger("#7811.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 10)) // Adjust as needed
            }
            .padding(__designTimeInteger("#7811.[1].[3].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 20))
            LogoutButton(authService: authService)
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ProfileView
import struct ROLOSOFT_FRONT.ProfileView_Previews

