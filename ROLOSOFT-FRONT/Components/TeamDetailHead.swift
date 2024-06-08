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
            HStack {
                VStack {
                    Text("1º")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: true, vertical: false)
                    Text("Lugar")
                        .foregroundColor(.white)
                        .fixedSize(horizontal: true, vertical: false)
                }
                .padding(.horizontal, 48)
                .padding(.vertical, 16)
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.854, green: 0.000, blue: 0.176, opacity: 0.85), Color(red: 0.882, green: 0.341, blue: 0.008, opacity: 0.85)]), startPoint: .bottom, endPoint: .top))
                .cornerRadius(8)
                Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                    GridRow {
                        VStack {
                            Text(String(teamDetails.goalDifference))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: true, vertical: false)
                            Text("DF")
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.gamesPlayed))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: true, vertical: false)
                            Text("JJ")
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.victories))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: true, vertical: false)
                            Text("JG")
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.points))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: true, vertical: false)
                            Text("PT")
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                    }
                    GridRow {
                        VStack {
                            Text(String(teamDetails.draws))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: true, vertical: false)
                            Text("JE")
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.defeats))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: true, vertical: false)
                            Text("JP")
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.goalsFor))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: true, vertical: false)
                            Text("GF")
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        Divider()
                        VStack {
                            Text(String(teamDetails.goalsAgainst))
                                .fontWeight(.bold)
                                .fixedSize(horizontal: true, vertical: false)
                            Text("GC")
                                .font(.caption)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                    }
                }
                .padding(.leading, 24)
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
