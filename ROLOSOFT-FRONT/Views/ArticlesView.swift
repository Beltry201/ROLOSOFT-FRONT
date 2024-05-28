//
//  ArticlesView.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 21/05/24.
//

import SwiftUI

struct ArticlesView: View {
    let articles: [Article] = dummyArticlesList
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("Noticias importantes")
                    .font(.title)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                
                // List of articles
                List {
                    ForEach(articles, id: \.id) { article in
                        NavigationLink(destination: Text("Hola")) {
                            ArticleCard(title: article.title, imageUrl: article.imageURL, dateString: "5 hours ago")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ArticlesView()
}
