//
//  URLImage.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 13/05/24.
//

import SwiftUI

struct URLImage: View {
    @ObservedObject var imageLoader = ImageLoader()
    var placeholder: Image
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        imageLoader.loadImage(fromURL: url)
    }
    
    var body: some View {
        if let uiImage = UIImage(data: imageLoader.imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        } else {
            placeholder
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    VStack {
        URLImage(url: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png")
            .frame(width: 100, height: 100)
        Text("Here's the image from URL")
    }
}
