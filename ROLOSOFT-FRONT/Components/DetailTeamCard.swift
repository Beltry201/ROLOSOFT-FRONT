//
//  DetailTeamCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 16/05/24.
//

import SwiftUI

struct DetailTeamCard: View {
    var data: DetailTeamData
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                VStack {
                    URLImage(url: data.logoImgUrl)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                }
                HStack {
                    VStack {
                        Text(data.name)
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
                                    Text(String(data.ties))
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

struct DetailTeamData {
    var name: String
    var logoImgUrl: String
    var victories: Int
    var ties: Int
    var defeats: Int
    var points: Int
}

#Preview {
    DetailTeamCard(data: DetailTeamData(name: "Nombre de equipo", logoImgUrl: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png", victories: 4, ties: 1, defeats: 2, points: 12))
}
