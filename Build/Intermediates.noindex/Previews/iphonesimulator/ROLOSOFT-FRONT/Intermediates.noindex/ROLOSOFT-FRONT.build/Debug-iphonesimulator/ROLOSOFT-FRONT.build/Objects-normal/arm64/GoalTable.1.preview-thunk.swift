@_private(sourceFile: "GoalTable.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension GoalTable_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/GoalTable.swift", line: 72)
        GoalTable(players: [
            GoalTablePlayer(imgUrl: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"), name: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[0].arg[1].value", fallback: "Nombre Jugador"), goals: __designTimeInteger("#7405.[3].[0].property.[0].[0].arg[0].value.[0].arg[2].value", fallback: 8), teamImgUrl: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[0].arg[3].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png")),
            GoalTablePlayer(imgUrl: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"), name: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[1].arg[1].value", fallback: "Nombre Jugador"), goals: __designTimeInteger("#7405.[3].[0].property.[0].[0].arg[0].value.[1].arg[2].value", fallback: 8), teamImgUrl: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[1].arg[3].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png")),
            GoalTablePlayer(imgUrl: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[2].arg[0].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"), name: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[2].arg[1].value", fallback: "Nombre Jugador"), goals: __designTimeInteger("#7405.[3].[0].property.[0].[0].arg[0].value.[2].arg[2].value", fallback: 8), teamImgUrl: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[2].arg[3].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png")),
            GoalTablePlayer(imgUrl: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[3].arg[0].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"), name: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[3].arg[1].value", fallback: "Nombre Jugador"), goals: __designTimeInteger("#7405.[3].[0].property.[0].[0].arg[0].value.[3].arg[2].value", fallback: 8), teamImgUrl: __designTimeString("#7405.[3].[0].property.[0].[0].arg[0].value.[3].arg[3].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"))
        ])
    
#sourceLocation()
    }
}

extension GoalTable {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/GoalTable.swift", line: 38)
        VStack {
            List(players.indices, id: \.self) { index in
                HStack {
                    Text("\(index + __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[0].value.[1].value.arg[0].value.[0]", fallback: 1))")
                        .font(.headline)
                        .foregroundColor(.black)
                    HStack(spacing: __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1].arg[0].value", fallback: 0)) {
                        URLImage(url: players[index].teamImgUrl)
                            .frame(width: __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[0].value", fallback: 30), height: __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[1].value", fallback: 30))
                        URLImage(url: players[index].imgUrl)
                            .frame(width: __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1].arg[1].value.[1].modifier[0].arg[0].value", fallback: 30), height: __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1].arg[1].value.[1].modifier[0].arg[1].value", fallback: 30))
                    }
                    Text(players[index].name)
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Text("\(players[index].goals)")
                        Text(players[index].goals == __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[4].arg[1].value.[1].arg[0].value.if.[0]", fallback: 1) ? __designTimeString("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[4].arg[1].value.[1].arg[0].value.then", fallback: "gol") : __designTimeString("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[4].arg[1].value.[1].arg[0].value.else", fallback: "goles"))
                            .font(.caption)
                    }
                }
                .padding()
                .modifier(ListItemBg(isMyPlayer: __designTimeBoolean("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].modifier[1].arg[0].value.arg[0].value", fallback: false))) // Adjust as necessary
                .cornerRadius(__designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].modifier[2].arg[0].value", fallback: 8))
                .listRowInsets(EdgeInsets.init(top: __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].modifier[3].arg[0].value.arg[0].value", fallback: 10), leading: __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].modifier[3].arg[0].value.arg[1].value", fallback: 0), bottom: __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].modifier[3].arg[0].value.arg[2].value", fallback: 10), trailing: __designTimeInteger("#7405.[2].[2].property.[0].[0].arg[0].value.[0].arg[2].value.[0].modifier[3].arg[0].value.arg[3].value", fallback: 0)))
            }
        }
    
#sourceLocation()
    }
}

extension GoalTable.ListItemBg {
typealias ListItemBg = GoalTable.ListItemBg

    @_dynamicReplacement(for: body(content:)) private func __preview__body(content: Content) -> some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/GoalTable.swift", line: 25)
            if let isMyPlayer = isMyPlayer, isMyPlayer {
                return AnyView(content
                    .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color(red: __designTimeFloat("#7405.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[0].value", fallback: 0.854), green: __designTimeFloat("#7405.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[1].value", fallback: 0.000), blue: __designTimeFloat("#7405.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[2].value", fallback: 0.176), opacity: __designTimeFloat("#7405.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[3].value", fallback: 0.85)), Color(red: __designTimeFloat("#7405.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[0].value", fallback: 0.882), green: __designTimeFloat("#7405.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[1].value", fallback: 0.341), blue: __designTimeFloat("#7405.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[2].value", fallback: 0.008), opacity: __designTimeFloat("#7405.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[3].value", fallback: 0.85))]), startPoint: .bottom, endPoint: .top))
                )
            } else {
                return AnyView(content
                    .listRowBackground(Color.white)
                )
            }
        
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.GoalTablePlayer
import struct ROLOSOFT_FRONT.GoalTable
import struct ROLOSOFT_FRONT.GoalTable_Previews

