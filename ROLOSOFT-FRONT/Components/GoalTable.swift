//
//  GoalTable.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 28/05/24.
//

import SwiftUI

struct GoalTablePlayer: Identifiable {
    let id = UUID()
    let imgUrl: String
    let name: String
    let goals: Int
    let teamImgUrl: String
}

struct GoalTable: View {
    let players: [GoalTablePlayer]
    
    var body: some View {
        NavigationView {
            VStack {
                List(players.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + 1).")
                            .font(.headline)
                        HStack(spacing: 0) {
                            URLImage(url: players[index].teamImgUrl)
                                .frame(width: 30, height: 30)
                            URLImage(url: players[index].imgUrl)
                                .frame(width: 30, height: 30)
                        }
                        Text(players[index].name)
                            .font(.headline)
                        Spacer()
                        Text(String(players[index].goals))
                            .font(.headline)
                    }
                    .padding()
                    .cornerRadius(8)
                    .listRowInsets(EdgeInsets.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
                .listStyle(.inset)
            }
        }
    }
}

#Preview {
    GoalTable(players: [
        GoalTablePlayer(imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", name: "Nombre Jugador", goals: 8, teamImgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"),
        GoalTablePlayer(imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", name: "Nombre Jugador", goals: 8, teamImgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"),
        GoalTablePlayer(imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", name: "Nombre Jugador", goals: 8, teamImgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"),
        GoalTablePlayer(imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", name: "Nombre Jugador", goals: 8, teamImgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png")
    ])
}
