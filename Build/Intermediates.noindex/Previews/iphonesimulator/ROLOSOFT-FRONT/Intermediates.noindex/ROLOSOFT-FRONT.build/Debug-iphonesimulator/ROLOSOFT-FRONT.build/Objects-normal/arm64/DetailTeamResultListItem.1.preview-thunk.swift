@_private(sourceFile: "DetailTeamResultListItem.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension DetailTeamResultCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/DetailTeamResultListItem.swift", line: 14)
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text(data.dateString)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                HStack {
                    VStack {
                        URLImage(url: __designTimeString("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"))
                             .aspectRatio(contentMode: .fit)
                             .frame(width: __designTimeInteger("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 50))
                        Text(data.nameA)
                            .frame(maxWidth: __designTimeInteger("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 70))
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .fixedSize(horizontal: __designTimeBoolean("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[0].value", fallback: false), vertical: __designTimeBoolean("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[1].value", fallback: true))
                    }
                    Spacer()
                    Text(String(data.scoreA))
                        .font(.title)
                    Spacer()
                    Text(__designTimeString("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[4].arg[0].value", fallback: "-"))
                        .font(.title)
                    Spacer()
                    Text(String(data.scoreB))
                        .font(.title)
                    Spacer()
                    VStack {
                        URLImage(url: __designTimeString("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].arg[0].value", fallback: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: __designTimeInteger("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].modifier[1].arg[0].value", fallback: 50))
                        Text(data.nameB)
                            .frame(maxWidth: __designTimeInteger("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[1].modifier[0].arg[0].value", fallback: 70))
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .fixedSize(horizontal: __designTimeBoolean("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[1].modifier[4].arg[0].value", fallback: false), vertical: __designTimeBoolean("#7073.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[1].modifier[4].arg[1].value", fallback: true))
                    }
                }
            }
            .padding(__designTimeInteger("#7073.[1].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 20))
            .frame(width: geometry.size.width)
            .background(.white)
            .cornerRadius(__designTimeInteger("#7073.[1].[1].property.[0].[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: 10))
            .shadow(color: Color.black.opacity(__designTimeFloat("#7073.[1].[1].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.modifier[0].arg[0].value", fallback: 0.1)), radius: __designTimeInteger("#7073.[1].[1].property.[0].[0].arg[0].value.[0].modifier[4].arg[1].value", fallback: 5), x: __designTimeInteger("#7073.[1].[1].property.[0].[0].arg[0].value.[0].modifier[4].arg[2].value", fallback: 0), y: __designTimeInteger("#7073.[1].[1].property.[0].[0].arg[0].value.[0].modifier[4].arg[3].value", fallback: 2))
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.DetailTeamResultCard
import struct ROLOSOFT_FRONT.DetailTeamResultCardData
#Preview {
    DetailTeamResultCard(data: DetailTeamResultCardData(logoA: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png", logoB: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png", nameA: "EquipoA", nameB: "EquipoB", scoreA: 2, scoreB: 1, dateString: "3 de feb 2024"))
}



