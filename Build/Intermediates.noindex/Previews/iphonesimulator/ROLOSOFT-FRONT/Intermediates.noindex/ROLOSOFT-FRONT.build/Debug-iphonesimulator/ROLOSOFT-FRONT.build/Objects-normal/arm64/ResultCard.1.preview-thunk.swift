@_private(sourceFile: "ResultCard.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ResultCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/ResultCard.swift", line: 14)
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text(data.dateString)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                HStack {
                    VStack {
                        if let url = data.teamA.logoUrl {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].modifier[0].arg[1].value", fallback: 60))
                            .cornerRadius(__designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value", fallback: 8))
                            .clipped()
                        } else {
                            Color.gray
                                .frame(width: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].modifier[0].arg[1].value", fallback: 60))
                                .cornerRadius(__designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].modifier[1].arg[0].value", fallback: 8))
                        }
                        Text(data.teamA.name)
                            .frame(maxWidth: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 70))
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .fixedSize(horizontal: __designTimeBoolean("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[0].value", fallback: false), vertical: __designTimeBoolean("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[1].value", fallback: true))
                    }
                    Spacer()
                    Text(String(data.teamA.score))
                        .font(.title)
                    Spacer()
                    Text(__designTimeString("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[4].arg[0].value", fallback: "-"))
                        .font(.title)
                    Spacer()
                    Text(String(data.teamB.score))
                        .font(.title)
                    Spacer()
                    VStack {
                        if let url = data.teamB.logoUrl {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[0].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[0].[0].modifier[0].arg[1].value", fallback: 60))
                            .cornerRadius(__designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[0].[0].modifier[1].arg[0].value", fallback: 8))
                            .clipped()
                        } else {
                            Color.gray
                                .frame(width: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[1].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[1].[0].modifier[0].arg[1].value", fallback: 60))
                                .cornerRadius(__designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[1].[0].modifier[1].arg[0].value", fallback: 8))
                        }
                        Text(data.teamB.name)
                            .frame(maxWidth: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[1].modifier[0].arg[0].value", fallback: 70))
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .fixedSize(horizontal: __designTimeBoolean("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[1].modifier[4].arg[0].value", fallback: false), vertical: __designTimeBoolean("#5631.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[1].modifier[4].arg[1].value", fallback: true))
                    }
                }
            }
            .padding(__designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 20))
            .frame(width: geometry.size.width)
            .background(.white)
            .cornerRadius(__designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: 10))
            .shadow(color: Color.black.opacity(__designTimeFloat("#5631.[1].[1].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.modifier[0].arg[0].value", fallback: 0.1)), radius: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].modifier[4].arg[1].value", fallback: 5), x: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].modifier[4].arg[2].value", fallback: 0), y: __designTimeInteger("#5631.[1].[1].property.[0].[0].arg[0].value.[0].modifier[4].arg[3].value", fallback: 2))
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ResultCard
import struct ROLOSOFT_FRONT.DetailTeamResultCardData
import struct ROLOSOFT_FRONT.ResultCardTeamData
#Preview {
    ResultCard(data: DetailTeamResultCardData(
                    teamA: ResultCardTeamData(
                        name: "EquipoA",
                        logoUrl: URL(string: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"),
                        score: 4),
                    teamB: ResultCardTeamData(
                        name: "EquipoB",
                        logoUrl: URL(string: "https://www.pikpng.com/pngl/m/430-4309067_escudo-del-club-independiente-santa-fe-cardenales-primer.png"),
                        score: 2), dateString: "Viernes 12 - 4:00 PM"))
}



