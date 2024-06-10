@_private(sourceFile: "TeamDetailHead.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension TeamDetailHead_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/TeamDetailHead.swift", line: 121)
        let sampleTeamDetails = TeamDetails(
            tournamentId: __designTimeString("#5750.[2].[0].property.[0].[0].value.arg[0].value", fallback: "1"),
            schoolId: __designTimeString("#5750.[2].[0].property.[0].[0].value.arg[1].value", fallback: "1"),
            schoolName: __designTimeString("#5750.[2].[0].property.[0].[0].value.arg[2].value", fallback: "Independiente Santa Fe"),
            defeats: __designTimeInteger("#5750.[2].[0].property.[0].[0].value.arg[3].value", fallback: 0),
            draws: __designTimeInteger("#5750.[2].[0].property.[0].[0].value.arg[4].value", fallback: 0),
            victories: __designTimeInteger("#5750.[2].[0].property.[0].[0].value.arg[5].value", fallback: 10),
            goalsFor: __designTimeInteger("#5750.[2].[0].property.[0].[0].value.arg[6].value", fallback: 20),
            goalsAgainst: __designTimeInteger("#5750.[2].[0].property.[0].[0].value.arg[7].value", fallback: 5),
            goalDifference: __designTimeInteger("#5750.[2].[0].property.[0].[0].value.arg[8].value", fallback: 15),
            gamesPlayed: __designTimeInteger("#5750.[2].[0].property.[0].[0].value.arg[9].value", fallback: 10),
            points: __designTimeInteger("#5750.[2].[0].property.[0].[0].value.arg[10].value", fallback: 30),
            position: __designTimeInteger("#5750.[2].[0].property.[0].[0].value.arg[11].value", fallback: 1),
            shieldFileName: __designTimeString("#5750.[2].[0].property.[0].[0].value.arg[12].value", fallback: "Escudo_de_Independiente_Santa_Fe.png")
        )
        TeamDetailHead(teamDetails: sampleTeamDetails)
    
#sourceLocation()
    }
}

extension TeamDetailHead {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/TeamDetailHead.swift", line: 14)
        VStack {
            VStack {
                URLImage(url: teamDetails.fullTeamPictureUrl)
                    .frame(width: __designTimeInteger("#5750.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 100))
                Text(teamDetails.schoolName)
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.bottom, __designTimeInteger("#5750.[1].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 24))
            HStack {
                VStack {
                    Text("\(teamDetails.position)º")
                        .font(.system(size: __designTimeInteger("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 48), weight: .bold))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: false))
                    Text(__designTimeString("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "Lugar"))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                }
                .padding(.horizontal, __designTimeInteger("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[0].arg[1].value", fallback: 48))
                .padding(.vertical, __designTimeInteger("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[1].value", fallback: 16))
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: __designTimeFloat("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[0].arg[0].value", fallback: 0.854), green: __designTimeFloat("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[0].arg[1].value", fallback: 0.000), blue: __designTimeFloat("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[0].arg[2].value", fallback: 0.176), opacity: __designTimeFloat("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[0].arg[3].value", fallback: 0.85)), Color(red: __designTimeFloat("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[1].arg[0].value", fallback: 0.882), green: __designTimeFloat("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[1].arg[1].value", fallback: 0.341), blue: __designTimeFloat("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[1].arg[2].value", fallback: 0.008), opacity: __designTimeFloat("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[1].arg[3].value", fallback: 0.85))]), startPoint: .bottom, endPoint: .top))
                .cornerRadius(__designTimeInteger("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value", fallback: 8))
                Grid(horizontalSpacing: __designTimeInteger("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value", fallback: 20), verticalSpacing: __designTimeInteger("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value", fallback: 20)) {
                    GridRow {
                        VStack {
                            Text(String(teamDetails.goalDifference))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: false))
                            Text(__designTimeString("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "DF"))
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.gamesPlayed))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[2].arg[0].value.[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[2].arg[0].value.[0].modifier[1].arg[1].value", fallback: false))
                            Text(__designTimeString("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[2].arg[0].value.[1].arg[0].value", fallback: "JJ"))
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[2].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[2].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.victories))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[4].arg[0].value.[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[4].arg[0].value.[0].modifier[1].arg[1].value", fallback: false))
                            Text(__designTimeString("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[4].arg[0].value.[1].arg[0].value", fallback: "JG"))
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[4].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[4].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.points))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[6].arg[0].value.[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[6].arg[0].value.[0].modifier[1].arg[1].value", fallback: false))
                            Text(__designTimeString("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[6].arg[0].value.[1].arg[0].value", fallback: "PT"))
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[6].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].arg[0].value.[6].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                        }
                    }
                    GridRow {
                        VStack {
                            Text(String(teamDetails.draws))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: false))
                            Text(__designTimeString("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "JE"))
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.defeats))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[2].arg[0].value.[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[2].arg[0].value.[0].modifier[1].arg[1].value", fallback: false))
                            Text(__designTimeString("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[2].arg[0].value.[1].arg[0].value", fallback: "JP"))
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[2].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[2].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.goalsFor))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[4].arg[0].value.[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[4].arg[0].value.[0].modifier[1].arg[1].value", fallback: false))
                            Text(__designTimeString("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[4].arg[0].value.[1].arg[0].value", fallback: "GF"))
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[4].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[4].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.goalsAgainst))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[6].arg[0].value.[0].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[6].arg[0].value.[0].modifier[1].arg[1].value", fallback: false))
                            Text(__designTimeString("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[6].arg[0].value.[1].arg[0].value", fallback: "GC"))
                                .font(.caption)
                                .fixedSize(horizontal: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[6].arg[0].value.[1].modifier[1].arg[0].value", fallback: true), vertical: __designTimeBoolean("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[1].arg[0].value.[6].arg[0].value.[1].modifier[1].arg[1].value", fallback: false))
                        }
                    }
                }
                .padding(.leading, __designTimeInteger("#5750.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[1].modifier[0].arg[1].value", fallback: 24))
            }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.TeamDetailHead
import struct ROLOSOFT_FRONT.TeamDetailHead_Previews

