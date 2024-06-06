//
//  DetailTeamCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 16/05/24.
//

import SwiftUI

struct DetailTeamCard: View {
    var data: TeamDetails
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                VStack {
                    URLImage(url: data.fullTeamPictureUrl)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                }
                HStack {
                    VStack {
                        Text(data.schoolName)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 10)
                        HStack {
                            HStack {
                                VStack {
                                    Text("V")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text(String(data.victories))
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .lineLimit(1)
                                }
                                .frame(width: 35, alignment: .center)
                                
                                VStack {
                                    Text("E")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text(String(data.draws))
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .frame(width: 30, alignment: .center)
                                
                                VStack {
                                    Text("D")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text(String(data.defeats))
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .frame(width: 30, alignment: .center)
                            }
                            Spacer()
                            VStack {
                                Text("Puntos")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(String(data.points))
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                        
                        }
                    }
                }
                .padding(.leading, 10)
            }
            .padding(20)
            .frame(width: geometry.size.width)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.854, green: 0.000, blue: 0.176, opacity: 0.85),
                                                Color(red: 0.882, green: 0.341, blue: 0.008, opacity: 0.85)]),
                    startPoint: .bottom,
                    endPoint: .top)
            )
            .cornerRadius(10)
        }
    }
}

#Preview {
    DetailTeamCard(data: TeamDetails(tournamentId: "22e92ec7-3ac6-48f5-96f9-c455a6d1ae8c", schoolId: "1", schoolName: "Nombre de equipo", defeats: 2, draws: 1, victories: 4, goalsFor: 10, goalsAgainst: 5, goalDifference: 5, gamesPlayed: 7, points: 12, position: 3, shieldFileName: "escudo-depor-cali.png"))
}
