//
//  PlayerCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 4/06/24.
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
    PlayerCard(imgUrl: "data:image/jpeg;base64,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", name: "Roberto Carlos", shirtNumber: 10, position: "Delantero")
}
