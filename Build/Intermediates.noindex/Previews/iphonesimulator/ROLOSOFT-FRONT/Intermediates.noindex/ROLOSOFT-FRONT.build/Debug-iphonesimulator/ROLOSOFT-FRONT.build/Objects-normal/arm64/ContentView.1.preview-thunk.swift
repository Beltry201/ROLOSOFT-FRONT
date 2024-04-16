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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/ContentView.swift", line: 12)
        VStack {
            Image(systemName: __designTimeString("#557.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "globe"))
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(__designTimeString("#557.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Hello, world!"))
        }
        .padding()
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ContentView
#Preview {
    ContentView()
}



