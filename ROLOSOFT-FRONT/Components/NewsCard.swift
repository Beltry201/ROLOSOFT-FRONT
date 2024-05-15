//
//  NewsCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 14/05/24.
//

import SwiftUI

struct NewsCard: View {
    var body: some View {
        HStack(spacing: 20) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8) {
                Text("Titulo")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("Fecha")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut")
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
    NewsCard()
}
