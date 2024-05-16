//
//  NewsCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 14/05/24.
//

import SwiftUI

struct NewsCard: View {
    var title: String
    var date: String
    var desc: String
    var imgUrl: String
    
    var body: some View {
        HStack(spacing: 20) {
            URLImage(url: imgUrl)
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("Fecha")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(desc)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .padding()
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

#Preview {
    NewsCard(title: "Titulo", date: "Fecha", desc: "Descripcion", imgUrl: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png")
}
