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
    var players: [GoalTablePlayer]

    struct ListItemBg: ViewModifier {
        var isMyPlayer: Bool? = false

        func body(content: Content) -> some View {
            if let isMyPlayer = isMyPlayer, isMyPlayer {
                return AnyView(content
                    .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color(red: 0.854, green: 0.000, blue: 0.176, opacity: 0.85), Color(red: 0.882, green: 0.341, blue: 0.008, opacity: 0.85)]), startPoint: .bottom, endPoint: .top))
                )
            } else {
                return AnyView(content
                    .listRowBackground(Color.white)
                )
            }
        }
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Jugador")
                Spacer()
                Text("Goles")
                Spacer()
            }
            .padding()
            .font(.headline)

            List(players.indices, id: \.self) { index in
                HStack {
                    Text("\(index + 1)")
                        .font(.headline)
                        .foregroundColor(.black)
                    HStack(spacing: 0) {
                        URLImage(url: players[index].teamImgUrl)
                            .frame(width: 30, height: 30)
                        URLImage(url: players[index].imgUrl)
                            .frame(width: 30, height: 30)
                    }
                    Text(players[index].name)
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Text("\(players[index].goals)")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .padding()
                .modifier(ListItemBg(isMyPlayer: false)) // Adjust as necessary
                .cornerRadius(8)
                .listRowInsets(EdgeInsets.init(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
        }
    }
}

struct GoalTable_Previews: PreviewProvider {
    static var previews: some View {
        GoalTable(players: [
            GoalTablePlayer(imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", name: "Nombre Jugador", goals: 8, teamImgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"),
            GoalTablePlayer(imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", name: "Nombre Jugador", goals: 8, teamImgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"),
            GoalTablePlayer(imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", name: "Nombre Jugador", goals: 8, teamImgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"),
            GoalTablePlayer(imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", name: "Nombre Jugador", goals: 8, teamImgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png")
        ])
    }
}
