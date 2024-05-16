//
//  ScoreCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 13/05/24.
//

import SwiftUI

struct ScoreCard: View {
    var teamA: ScoreCardTeamData
    var teamB: ScoreCardTeamData
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                        gradient: Gradient(colors: [Color(red: 0.854, green: 0.000, blue: 0.176, opacity: 0.85),
                                                    Color(red: 0.882, green: 0.341, blue: 0.008, opacity: 0.85)]),
                        startPoint: .bottom,
                        endPoint: .top))
                    .frame(height: 180)
                    .shadow(color: Color.black.opacity(0.10), radius: 24, x: 0, y: 0)

            HStack {
                TeamScoreView(name: teamA.name, logoUrl: teamA.logo)
                
                VStack {
                    Spacer()
                    Text("\(teamA.score) - \(teamB.score)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                
                TeamScoreView(name: teamB.name, logoUrl: teamB.logo)
            }
            .padding()
        }
        .frame(height: 180)
    }
}

struct TeamScoreView: View {
    var name: String
    var logoUrl: String

    var body: some View {
        VStack(alignment: .center) {
            URLImage(url: logoUrl)
                .frame(width: 50, height: 50)
            Text(name)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 2)
            Text("(12' Jugador)")
                .font(.caption2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .fontWeight(.light)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
        .frame(maxWidth: 120)
    }
}

struct ScoreCardTeamData {
    var name: String
    var logo: String
    var score: Int
}

struct ScoreCardPreview: PreviewProvider {
    static var previews: some View {
        ScoreCard(teamA: ScoreCardTeamData(name: "EquipoA", logo: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png", score: 2), teamB: ScoreCardTeamData(name: "EquipoB", logo: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png", score: 1))
            .padding()
    }
}
