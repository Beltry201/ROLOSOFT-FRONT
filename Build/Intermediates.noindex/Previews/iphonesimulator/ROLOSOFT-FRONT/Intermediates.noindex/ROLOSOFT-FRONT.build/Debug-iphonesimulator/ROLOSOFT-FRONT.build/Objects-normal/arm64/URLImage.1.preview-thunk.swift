@_private(sourceFile: "URLImage.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension URLImage {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/URLImage.swift", line: 20)
        if let uiImage = UIImage(data: imageLoader.imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        } else {
            placeholder
                .resizable()
                .scaledToFit()
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.URLImage
#Preview {
    VStack {
        URLImage(url: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png")
            .frame(width: 100, height: 100)
        Text("Here's the image from URL")
    }
}



