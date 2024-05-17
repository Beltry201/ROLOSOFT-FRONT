//
//  DetailTeamResultListItem.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 16/05/24.
//

import SwiftUI

struct DetailTeamResultCard: View {
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
                        URLImage(url: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png")
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 50)
                        Text(data.nameA)
                            .frame(maxWidth: 70)
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                    Text(String(data.scoreA))
                        .font(.title)
                    Spacer()
                    Text("-")
                        .font(.title)
                    Spacer()
                    Text(String(data.scoreB))
                        .font(.title)
                    Spacer()
                    VStack {
                        URLImage(url: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text(data.nameB)
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
    var logoA: String
    var logoB: String
    var nameA: String
    var nameB: String
    var scoreA: Int
    var scoreB: Int
    var dateString: String
}

#Preview {
    DetailTeamResultCard(data: DetailTeamResultCardData(logoA: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png", logoB: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png", nameA: "EquipoA", nameB: "EquipoB", scoreA: 2, scoreB: 1, dateString: "3 de feb 2024"))
}
