//
//  GridPlayers.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 28/05/24.
//

import SwiftUI

struct GridPlayer: View {
    let name: String
    let shirtNumber: Int
    let imgUrl: URL?
    
    var body: some View {
        VStack {
            if let url = imgUrl {
                AsyncImage(url: url) { image in
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
            Text(String(shirtNumber))
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

struct GridPlayers: View {
    let players: [GridPlayer]

    let columnGrid: [GridItem] = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]

    var body: some View {
        LazyVGrid(columns: columnGrid, spacing: 20) {
            ForEach(players.indices, id: \.self) { index in
                GridPlayer(name: players[index].name, shirtNumber: players[index].shirtNumber, imgUrl: players[index].imgUrl)
            }
        }
    }
}

#Preview {
    GridPlayers(players: [
        GridPlayer(name: "Nombre mas largo", shirtNumber: 10, imgUrl: nil),
        GridPlayer(name: "Nombre", shirtNumber: 10, imgUrl: nil),
        GridPlayer(name: "Nombre", shirtNumber: 10, imgUrl: nil),
        GridPlayer(name: "Nombre", shirtNumber: 10, imgUrl: nil)
    ])
}
