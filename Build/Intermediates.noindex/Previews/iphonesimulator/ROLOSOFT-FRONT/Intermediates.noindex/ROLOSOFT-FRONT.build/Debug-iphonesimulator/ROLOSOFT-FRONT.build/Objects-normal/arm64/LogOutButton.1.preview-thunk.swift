@_private(sourceFile: "LogOutButton.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension LogoutButton {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/LogOutButton.swift", line: 15)
        Button(action: {
            authService.logOut() // Call logOut method from AuthService
            presentationMode.wrappedValue.dismiss() // Dismiss the current view
        }) {
            HStack {
                Image(systemName: __designTimeString("#6413.[1].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "person.crop.circle.fill.badge.xmark"))
                    .foregroundColor(.red)
                Text(__designTimeString("#6413.[1].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: "Cerrar sesión"))
                    .foregroundColor(.red)
                    .padding()
                    .cornerRadius(__designTimeInteger("#6413.[1].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: 10))
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(__designTimeFloat("#6413.[1].[2].property.[0].[0].arg[1].value.[0].modifier[1].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
            .cornerRadius(__designTimeInteger("#6413.[1].[2].property.[0].[0].arg[1].value.[0].modifier[2].arg[0].value", fallback: 10))
            .shadow(color: Color.black.opacity(__designTimeFloat("#6413.[1].[2].property.[0].[0].arg[1].value.[0].modifier[3].arg[0].value.modifier[0].arg[0].value", fallback: 0.1)), radius: __designTimeInteger("#6413.[1].[2].property.[0].[0].arg[1].value.[0].modifier[3].arg[1].value", fallback: 5), x: __designTimeInteger("#6413.[1].[2].property.[0].[0].arg[1].value.[0].modifier[3].arg[2].value", fallback: 0), y: __designTimeInteger("#6413.[1].[2].property.[0].[0].arg[1].value.[0].modifier[3].arg[3].value", fallback: 2))
            .padding(.horizontal, __designTimeInteger("#6413.[1].[2].property.[0].[0].arg[1].value.[0].modifier[4].arg[1].value", fallback: 20))
            .padding(.top, __designTimeInteger("#6413.[1].[2].property.[0].[0].arg[1].value.[0].modifier[5].arg[1].value", fallback: 10))
            
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.LogoutButton
#Preview {
    let authService = AuthService()
    return LogoutButton(authService: authService)
}



