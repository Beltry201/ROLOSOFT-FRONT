@_private(sourceFile: "NewsCard.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension NewsCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/NewsCard.swift", line: 17)
        HStack(spacing: __designTimeInteger("#14126.[1].[4].property.[0].[0].arg[0].value", fallback: 20)) {
            URLImage(url: imgUrl)
                .frame(width: __designTimeInteger("#14126.[1].[4].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: 100), height: __designTimeInteger("#14126.[1].[4].property.[0].[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: 100))
                .cornerRadius(__designTimeInteger("#14126.[1].[4].property.[0].[0].arg[1].value.[0].modifier[1].arg[0].value", fallback: 10))

            VStack(alignment: .leading, spacing: __designTimeInteger("#14126.[1].[4].property.[0].[0].arg[1].value.[1].arg[1].value", fallback: 8)) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(__designTimeString("#14126.[1].[4].property.[0].[0].arg[1].value.[1].arg[2].value.[1].arg[0].value", fallback: "Fecha"))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(desc)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .frame(height: /*@START_MENU_TOKEN@*/__designTimeInteger("#14126.[1].[4].property.[0].[0].modifier[0].arg[0].value", fallback: 100)/*@END_MENU_TOKEN@*/)
        .padding()
        .background(.white)
        .cornerRadius(__designTimeInteger("#14126.[1].[4].property.[0].[0].modifier[3].arg[0].value", fallback: 20))
        .shadow(color: Color.black.opacity(__designTimeFloat("#14126.[1].[4].property.[0].[0].modifier[4].arg[0].value.modifier[0].arg[0].value", fallback: 0.1)), radius: __designTimeInteger("#14126.[1].[4].property.[0].[0].modifier[4].arg[1].value", fallback: 5), x: __designTimeInteger("#14126.[1].[4].property.[0].[0].modifier[4].arg[2].value", fallback: 0), y: __designTimeInteger("#14126.[1].[4].property.[0].[0].modifier[4].arg[3].value", fallback: 2))
        .padding(.horizontal)
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.NewsCard
#Preview {
    NewsCard(title: "Titulo", date: "Fecha", desc: "Descripcion", imgUrl: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png")
}



