//
//  GridPhotos.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 13/06/24.
//

import SwiftUI

struct GridPhoto: View {
    let url: URL?
    
    var body: some View {
        VStack {
            if let _url = url {
                AsyncImage(url: _url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: (UIScreen.main.bounds.width / 3) - 1, height: (UIScreen.main.bounds.width / 3) - 1)
                .clipped()
            } else {
                Color.gray
                    .frame(width: (UIScreen.main.bounds.width / 3) - 1, height: (UIScreen.main.bounds.width / 3) - 1)
            }
        }
    }
}

struct GridPhotos: View {
    let photos: [GridPhoto]

    let columnGrid: [GridItem] = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]

    var body: some View {
        LazyVGrid(columns: columnGrid, spacing: 1) {
            ForEach(photos.indices, id: \.self) { index in
                GridPhoto(url: photos[index].url)
            }
        }
    }
}

#Preview {
    GridPhotos(photos: [
        GridPhoto(url: nil),
        GridPhoto(url: nil),
        GridPhoto(url: nil),
        GridPhoto(url: nil)
    ])
}
