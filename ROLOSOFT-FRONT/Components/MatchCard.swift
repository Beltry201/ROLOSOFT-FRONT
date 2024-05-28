//
//  MatchCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 13/05/24.
//

import SwiftUI

struct MatchCard: View {
    var teamA: MatchEvent.Team
    var teamB: MatchEvent.Team
    var dateString: String
    var isMyMatch: Bool? = false
    
    var body: some View {
        VStack {
            Text(dateString)
                .foregroundColor(isMyMatch! ? .white : .black)
                .font(.caption)
            
            HStack(alignment: .top) {
                TeamBox(name: teamA.name, logoUrl: teamA.shieldImg ?? "", isMyMatch: isMyMatch!)
                
                Spacer()
                
                VStack {
                    Text("VS")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(isMyMatch! ? .white : .black)
                }
                
                Spacer()
                
                TeamBox(name: teamB.name, logoUrl: teamB.shieldImg ?? "", isMyMatch: isMyMatch)
            }
        }
        .padding()
        .modifier(BackgroundModifier(isMyMatch: isMyMatch!))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct BackgroundModifier: ViewModifier {
    var isMyMatch: Bool? = false

    func body(content: Content) -> some View {
        if let isMyMatch = isMyMatch, isMyMatch {
            return AnyView(content
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.854, green: 0.000, blue: 0.176, opacity: 0.85), Color(red: 0.882, green: 0.341, blue: 0.008, opacity: 0.85)]), startPoint: .bottom, endPoint: .top))
            )
        } else {
            return AnyView(content
                .background(Color.white)
            )
        }
    }
}

struct TeamBox: View {
    var name: String
    var logoUrl: String
    var isMyMatch: Bool? = false

    var body: some View {
        VStack(alignment: .center) {
            URLImage(url: logoUrl)
                .frame(width: 50, height: 50)
            Text(name)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(isMyMatch! ? .white : .black)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: 120)
    }
}

struct ScoreCardTeamData {
    var name: String
    var logo: String
}

//struct ScoreCardPreview: PreviewProvider {
//    static var previews: some View {
//        MatchCard(teamA: ScoreCardTeamData(name: "EquipoA", logo: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"), teamB: ScoreCardTeamData(name: "EquipoB", logo: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"), dateString: "4:00 PM")
//    }
//}
