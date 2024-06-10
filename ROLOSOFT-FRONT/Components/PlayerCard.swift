//
//  PlayerCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 10/06/24.
//

import SwiftUI

struct PlayerCard: View {
    let imgUrl: String
    let name: String
    let shirtNumber: Int
    let position: String
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.854, green: 0.000, blue: 0.176, opacity: 0.85),
                    Color(red: 0.882, green: 0.341, blue: 0.008, opacity: 0.85)
                ]),
                startPoint: .bottom,
                endPoint: .top
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                URLImage(url: imgUrl)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                
                Text(name)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.bottom, 8)
                
                Text(String(shirtNumber))
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.bottom, 8)
                
                HStack {
                    Text("posicion:")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                    Text(position)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                
                Spacer()
            }
            .frame(maxWidth: 350)
            .background(.white)
            .cornerRadius(25)
            .shadow(radius: 10)
            .padding()
        }
    }
}

#Preview {
    PlayerCard(imgUrl: "data:image/jpeg;base64,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", name: "Roberto Carlos", shirtNumber: 6, position: "Defensa")
}
