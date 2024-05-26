//
//  NewsCard.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 14/05/24.
//

import SwiftUI

struct ArticleCard: View {
    let title: String
    let imageUrl: URL?
    let dateString: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.body)
                    .foregroundColor(.black)
                    .lineLimit(2)
                Text(dateString)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 5)
            
            Spacer()
            
            if let url = imageUrl {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 60, height: 60)
                .cornerRadius(8)
                .clipped()
            } else {
                Color.gray
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
    }
}

#Preview {
    ArticleCard(
        title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        imageUrl: URL(string: "https://example.com/image.jpg"),
        dateString: "5 hours ago"
    )
}
