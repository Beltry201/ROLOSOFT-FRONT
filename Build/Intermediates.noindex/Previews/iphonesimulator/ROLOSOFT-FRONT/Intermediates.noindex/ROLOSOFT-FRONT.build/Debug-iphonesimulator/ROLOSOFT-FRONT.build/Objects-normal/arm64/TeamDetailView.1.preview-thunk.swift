@_private(sourceFile: "TeamDetailView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension TeamDetailView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 14)
        VStack {
            TeamDetailHead(
                logoUrl: __designTimeString("#3844.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png"), // Asegúrate de tener la URL correcta
                position: teamDetail.position,
                name: teamDetail.schoolName,
                df: teamDetail.goalDifference,
                jj: teamDetail.gamesPlayed,
                jg: teamDetail.victories,
                pt: teamDetail.points,
                je: teamDetail.draws,
                jp: teamDetail.defeats,
                gf: teamDetail.goalsFor,
                gc: teamDetail.goalsAgainst
            )
            .padding()
            
            // Agregar más componentes si es necesario
        }
        .navigationTitle(__designTimeString("#3844.[1].[1].property.[0].[0].modifier[0].arg[0].value", fallback: "Detalles del Equipo"))
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.TeamDetailView
#Preview {
    TeamDetailView(
        teamDetail: TeamDetails(
            tournamentId: "1",
            schoolId: "1",
            schoolName: "Independiente Santa Fe",
            defeats: 3,
            draws: 5,
            victories: 10,
            goalsFor: 20,
            goalsAgainst: 10,
            goalDifference: 10,
            gamesPlayed: 18,
            points: 35,
            position: 2
        )
    )
}



