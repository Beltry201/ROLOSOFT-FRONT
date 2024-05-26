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

#Preview {
    ArticlesView()
}
