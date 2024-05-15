@_private(sourceFile: "ScoreCard.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ScoreCardPreview {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/ScoreCard.swift", line: 53)
        ScoreCard()
            .padding()
    
#sourceLocation()
    }
}

extension TeamScoreView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/ScoreCard.swift", line: 37)
        VStack(alignment: .center) {
            URLImage(url: __designTimeString("#8990.[2].[2].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"))
                .frame(width: __designTimeInteger("#8990.[2].[2].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: 50), height: __designTimeInteger("#8990.[2].[2].property.[0].[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: 50))
            Text(teamName)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .fixedSize(horizontal: __designTimeBoolean("#8990.[2].[2].property.[0].[0].arg[1].value.[1].modifier[3].arg[0].value", fallback: false), vertical: __designTimeBoolean("#8990.[2].[2].property.[0].[0].arg[1].value.[1].modifier[3].arg[1].value", fallback: true))
        }
        .frame(maxWidth: __designTimeInteger("#8990.[2].[2].property.[0].[0].modifier[0].arg[0].value", fallback: 120))
        .padding(.vertical, __designTimeInteger("#8990.[2].[2].property.[0].[0].modifier[1].arg[1].value", fallback: 4))
    
#sourceLocation()
    }
}

extension ScoreCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/ScoreCard.swift", line: 12)
        ZStack {
            RoundedRectangle(cornerRadius: __designTimeInteger("#8990.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: 20))
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .bottom, endPoint: .top))
                .frame(height: __designTimeInteger("#8990.[1].[0].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 150))
                .shadow(radius: __designTimeInteger("#8990.[1].[0].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 10))

            HStack {
                TeamScoreView(teamName: __designTimeString("#8990.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Independiente Santa Fé"), teamLogo: __designTimeString("#8990.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value", fallback: "santafe_logo"))
                
                Text(__designTimeString("#8990.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value", fallback: "2 - 1"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                TeamScoreView(teamName: __designTimeString("#8990.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[2].arg[0].value", fallback: "América de Cali"), teamLogo: __designTimeString("#8990.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[2].arg[1].value", fallback: "americadecali_logo"))
            }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ScoreCard
import struct ROLOSOFT_FRONT.TeamScoreView
import struct ROLOSOFT_FRONT.ScoreCardPreview

