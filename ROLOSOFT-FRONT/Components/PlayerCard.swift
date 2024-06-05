//
//  PlayerCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 4/06/24.
//

import SwiftUI

struct PlayerCard: View {
    var body: some View {
        VStack {
            Image("player_image") // Replace with your image name
                .resizable()
                .frame(width: .infinity)
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding(20)
            
            Text("Nombre de jugador")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.black)
            
            Text("Posicion")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .padding(.bottom, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(25)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    PlayerCard()
}
