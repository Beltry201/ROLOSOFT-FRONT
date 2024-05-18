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
    var hour: String
    var isMyMatch: Bool = true
    
    var body: some View {
        VStack {
            Text(hour)
                .foregroundColor(isMyMatch ? .white : .black)
                .font(.caption)
            
            HStack(alignment: .top) {
                TeamBox(name: teamA.name, logoUrl: teamA.logo, isMyMatch: isMyMatch)
                
                Spacer()
                
                VStack {
                    Text("VS")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(isMyMatch ? .white : .black)
                }
                
                Spacer()
                
                TeamBox(name: teamB.name, logoUrl: teamB.logo, isMyMatch: isMyMatch)
            }
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: isMyMatch == true ?
                                   [Color(red: 0.854, green: 0.000, blue: 0.176, opacity: 0.85), Color(red: 0.882, green: 0.341, blue: 0.008, opacity: 0.85)] :
                                    [Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.0), Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.0)]
                ),
                startPoint: .bottom,
                endPoint: .top
            )
        )
        .cornerRadius(10)
    }
}

struct TeamBox: View {
    var name: String
    var logoUrl: String
    var isMyMatch: Bool = false

    var body: some View {
        VStack(alignment: .center) {
            URLImage(url: logoUrl)
                .frame(width: 50, height: 50)
            Text(name)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(isMyMatch ? .white : .black)
                .fixedSize(horizontal: false, vertical: true)
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
        ScoreCard(teamA: ScoreCardTeamData(name: "EquipoA ak adkadla da", logo: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png", score: 2), teamB: ScoreCardTeamData(name: "EquipoB", logo: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png", score: 1), hour: "4:00 PM")
    }
}
