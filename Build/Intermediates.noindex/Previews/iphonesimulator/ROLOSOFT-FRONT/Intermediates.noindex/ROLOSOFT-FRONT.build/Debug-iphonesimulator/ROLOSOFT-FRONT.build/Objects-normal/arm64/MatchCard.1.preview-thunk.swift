@_private(sourceFile: "MatchCard.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension TeamBox {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCard.swift", line: 68)
        VStack(alignment: .center) {
            URLImage(url: logoUrl)
                .frame(width: __designTimeInteger("#4843.[3].[3].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: 50), height: __designTimeInteger("#4843.[3].[3].property.[0].[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: 50))
            Text(name)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(isMyMatch! ? .white : .black)
                .fixedSize(horizontal: __designTimeBoolean("#4843.[3].[3].property.[0].[0].arg[1].value.[1].modifier[3].arg[0].value", fallback: false), vertical: __designTimeBoolean("#4843.[3].[3].property.[0].[0].arg[1].value.[1].modifier[3].arg[1].value", fallback: true))
        }
        .frame(maxWidth: __designTimeInteger("#4843.[3].[3].property.[0].[0].modifier[0].arg[0].value", fallback: 120))
    
#sourceLocation()
    }
}

extension BackgroundModifier {
    @_dynamicReplacement(for: body(content:)) private func __preview__body(content: Content) -> some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCard.swift", line: 50)
        if let isMyMatch = isMyMatch, isMyMatch {
            return AnyView(content
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: __designTimeFloat("#4843.[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[0].value", fallback: 0.854), green: __designTimeFloat("#4843.[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[1].value", fallback: 0.000), blue: __designTimeFloat("#4843.[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[2].value", fallback: 0.176), opacity: __designTimeFloat("#4843.[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[3].value", fallback: 0.85)), Color(red: __designTimeFloat("#4843.[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[0].value", fallback: 0.882), green: __designTimeFloat("#4843.[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[1].value", fallback: 0.341), blue: __designTimeFloat("#4843.[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[2].value", fallback: 0.008), opacity: __designTimeFloat("#4843.[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[3].value", fallback: 0.85))]), startPoint: .bottom, endPoint: .top))
            )
        } else {
            return AnyView(content
                .background(Color.white)
            )
        }
    
#sourceLocation()
    }
}

extension MatchCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/MatchCard.swift", line: 17)
        VStack {
            Text(dateString)
                .foregroundColor(isMyMatch! ? .white : .black)
                .font(.caption)
            
            HStack(alignment: .top) {
                TeamBox(name: teamA.name, logoUrl: teamA.shieldImg ?? __designTimeString("#4843.[1].[4].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[0]", fallback: ""), isMyMatch: isMyMatch!)
                
                Spacer()
                
                VStack {
                    Text(__designTimeString("#4843.[1].[4].property.[0].[0].arg[0].value.[1].arg[1].value.[2].arg[0].value.[0].arg[0].value", fallback: "VS"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(isMyMatch! ? .white : .black)
                }
                
                Spacer()
                
                TeamBox(name: teamB.name, logoUrl: teamB.shieldImg ?? __designTimeString("#4843.[1].[4].property.[0].[0].arg[0].value.[1].arg[1].value.[4].arg[1].value.[0]", fallback: ""), isMyMatch: isMyMatch)
            }
        }
        .padding()
        .modifier(BackgroundModifier(isMyMatch: isMyMatch!))
        .cornerRadius(__designTimeInteger("#4843.[1].[4].property.[0].[0].modifier[2].arg[0].value", fallback: 10))
        .shadow(color: Color.black.opacity(__designTimeFloat("#4843.[1].[4].property.[0].[0].modifier[3].arg[0].value.modifier[0].arg[0].value", fallback: 0.1)), radius: __designTimeInteger("#4843.[1].[4].property.[0].[0].modifier[3].arg[1].value", fallback: 5), x: __designTimeInteger("#4843.[1].[4].property.[0].[0].modifier[3].arg[2].value", fallback: 0), y: __designTimeInteger("#4843.[1].[4].property.[0].[0].modifier[3].arg[3].value", fallback: 2))
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.MatchCard
import struct ROLOSOFT_FRONT.BackgroundModifier
import struct ROLOSOFT_FRONT.TeamBox
import struct ROLOSOFT_FRONT.ScoreCardTeamData

