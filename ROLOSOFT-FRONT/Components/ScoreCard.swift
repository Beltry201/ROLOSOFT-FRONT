//
//  ScoreCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 13/05/24.
//

import SwiftUI

struct FootballScoreCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .bottom, endPoint: .top))
                .frame(height: 150)
                .shadow(radius: 10)

            HStack {
                TeamScoreView(teamName: "Independiente Santa Fé", teamLogo: "santafe_logo")
                
                Text("2 - 1")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                TeamScoreView(teamName: "América de Cali", teamLogo: "americadecali_logo")
            }
        }
    }
}

struct TeamScoreView: View {
    var teamName: String
    var teamLogo: String

    var body: some View {
        VStack(alignment: .center) {
            URLImage(url: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png")
                .frame(width: 50, height: 50)
            Text(teamName)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: 120)
        .padding(.vertical, 4)
    }
}

struct FootballScoreCardPreview: PreviewProvider {
    static var previews: some View {
        FootballScoreCard()
            .padding()
    }
}
