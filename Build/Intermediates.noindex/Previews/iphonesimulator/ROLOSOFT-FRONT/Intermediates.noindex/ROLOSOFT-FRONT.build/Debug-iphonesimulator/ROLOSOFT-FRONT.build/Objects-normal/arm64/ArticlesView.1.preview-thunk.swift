@_private(sourceFile: "ArticlesView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ArticlesView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/ArticlesView.swift", line: 14)
        NavigationView {
            
            VStack(alignment: .leading) {
                Text(__designTimeString("#9836.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "Buscar en el torneo"))
                    .font(.title)
                    .padding(.horizontal, __designTimeInteger("#9836.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[0].modifier[1].arg[1].value", fallback: 10))
                    .padding(.vertical, __designTimeInteger("#9836.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[0].modifier[2].arg[1].value", fallback: 20))
                
                // List of articles
                List {
                    ForEach(articles, id: \.id) { article in
                        NavigationLink(destination: Text(__designTimeString("#9836.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[1].arg[0].value.[0].arg[2].value.[0].arg[0].value.arg[0].value", fallback: "Hola"))) {
                            ArticleCard(title: article.title, imageUrl: article.imageURL, dateString: __designTimeString("#9836.[1].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[1].arg[0].value.[0].arg[2].value.[0].arg[1].value.[0].arg[2].value", fallback: "5 hours ago"))
                        }
                    }
                }
            }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ArticlesView
#Preview {
    ArticlesView()
}



