@_private(sourceFile: "ButtonModifier.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ButtonModifier {
    @_dynamicReplacement(for: body(content:)) private func __preview__body(content: Content) -> some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Modifiers/ButtonModifier.swift", line: 12)
        content
            .frame(minWidth: __designTimeInteger("#10917.[1].[0].[0].modifier[0].arg[0].value", fallback: 0), maxWidth: .infinity)
            .frame(height: __designTimeInteger("#10917.[1].[0].[0].modifier[1].arg[0].value", fallback: 48))
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(__designTimeInteger("#10917.[1].[0].[0].modifier[4].arg[0].value", fallback: 8))
            .fontWeight(.bold)
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ButtonModifier

