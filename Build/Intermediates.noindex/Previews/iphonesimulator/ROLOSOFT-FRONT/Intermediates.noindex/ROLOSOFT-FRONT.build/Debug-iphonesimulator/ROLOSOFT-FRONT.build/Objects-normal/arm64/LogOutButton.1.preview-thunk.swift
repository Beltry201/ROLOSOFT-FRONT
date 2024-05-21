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
            Text(__designTimeString("#7295.[1].[2].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "Logout"))
                .foregroundColor(.red)
                .padding()
                .background(Color.gray.opacity(__designTimeFloat("#7295.[1].[2].property.[0].[0].arg[1].value.[0].modifier[2].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                .cornerRadius(__designTimeInteger("#7295.[1].[2].property.[0].[0].arg[1].value.[0].modifier[3].arg[0].value", fallback: 10))
        }
        .padding()
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.LogoutButton
#Preview {
    let authService = AuthService()
    return LogoutButton(authService: authService)
}



