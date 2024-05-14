@_private(sourceFile: "LoadingView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension LoadingView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LoadingView.swift", line: 12)
        VStack {
            ProgressView() // Display a system progress view
                .progressViewStyle(CircularProgressViewStyle()) // Customize the progress view style
                .padding()
            
            Text(__designTimeString("#14287.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Loading...")) // Display a loading text
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(__designTimeFloat("#14287.[1].[0].property.[0].[0].modifier[1].arg[0].value.modifier[0].arg[0].value", fallback: 0.8))) // Semi-transparent white background
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.LoadingView
#Preview {
    LoadingView()
}



