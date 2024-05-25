@_private(sourceFile: "ImageLoader.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation
import Combine
import SwiftUI

extension ImageLoader {
    @_dynamicReplacement(for: loadImage(fromURL:)) private func __preview__loadImage(fromURL urlString: String) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Helpers/ImageLoader.swift", line: 16)
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    
#sourceLocation()
    }
}

import class ROLOSOFT_FRONT.ImageLoader

