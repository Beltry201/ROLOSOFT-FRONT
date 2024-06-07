//
//  TeamDetailHead.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 4/06/24.
//

import SwiftUI

struct TeamDetailHead: View {
    let teamDetails: TeamDetails

    var body: some View {
        VStack {
            VStack {
                URLImage(url: teamDetails.fullTeamPictureUrl)
                    .frame(width: 100)
                Text(teamDetails.schoolName)
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.bottom, 24)
            Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                GridRow {
                    VStack {
                        Text(String(teamDetails.goalDifference))
                            .fontWeight(.bold)
                        Text("DF")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(teamDetails.gamesPlayed))
                            .fontWeight(.bold)
                        Text("JJ")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(teamDetails.victories))
                            .fontWeight(.bold)
                        Text("JG")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(teamDetails.points))
                            .fontWeight(.bold)
                        Text("PT")
                            .font(.caption)
                    }
                }
                GridRow {
                    VStack {
                        Text(String(teamDetails.draws))
                            .fontWeight(.bold)
                        Text("JE")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(teamDetails.defeats))
                            .fontWeight(.bold)
                        Text("JP")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(teamDetails.goalsFor))
                            .fontWeight(.bold)
                        Text("GF")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(teamDetails.goalsAgainst))
                            .fontWeight(.bold)
                        Text("GC")
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct TeamDetailHead_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTeamDetails = TeamDetails(
            tournamentId: "1",
            schoolId: "1",
            schoolName: "Independiente Santa Fe",
            defeats: 0,
            draws: 0,
            victories: 10,
            goalsFor: 20,
            goalsAgainst: 5,
            goalDifference: 15,
            gamesPlayed: 10,
            points: 30,
            position: 1,
            shieldFileName: "Escudo_de_Independiente_Santa_Fe.png"
        )
        TeamDetailHead(teamDetails: sampleTeamDetails)
    }
}
