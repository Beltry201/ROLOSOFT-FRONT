//
//  DetailTeamResultListItem.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 16/05/24.
//

import SwiftUI

struct ResultCard: View {
    var data: DetailTeamResultCardData
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text(data.dateString)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                HStack {
                    VStack {
                        if let url = data.teamA.logoUrl {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                            .clipped()
                        } else {
                            Color.gray
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                        }
                        Text(data.teamA.name)
                            .frame(maxWidth: 70)
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                    Text(String(data.teamA.score))
                        .font(.title)
                    Spacer()
                    Text("-")
                        .font(.title)
                    Spacer()
                    Text(String(data.teamB.score))
                        .font(.title)
                    Spacer()
                    VStack {
                        if let url = data.teamB.logoUrl {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                            .clipped()
                        } else {
                            Color.gray
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                        }
                        Text(data.teamB.name)
                            .frame(maxWidth: 70)
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding(20)
            .frame(width: geometry.size.width)
            .background(.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

struct DetailTeamResultCardData {
    var teamA: ResultCardTeamData
    var teamB: ResultCardTeamData
    var dateString: String
}

struct ResultCardTeamData {
    var name: String
    var logoUrl: URL?
    var score: Int
}

#Preview {
    ResultCard(data: DetailTeamResultCardData(
                    teamA: ResultCardTeamData(
                        name: "EquipoA",
                        logoUrl: URL(string: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"),
                        score: 4),
                    teamB: ResultCardTeamData(
                        name: "EquipoB",
                        logoUrl: URL(string: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"),
                        score: 2), dateString: "Viernes 12 - 4:00 PM"))
}
