@_private(sourceFile: "DetailTeamCard.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension DetailTeamCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/DetailTeamCard.swift", line: 14)
        GeometryReader { geometry in
            HStack {
                VStack {
                    URLImage(url: data.fullTeamPictureUrl)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: __designTimeInteger("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 120))
                }
                HStack {
                    VStack {
                        Text(data.schoolName)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, __designTimeInteger("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].modifier[3].arg[1].value", fallback: 10))
                        HStack {
                            HStack {
                                VStack {
                                    Text(__designTimeString("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "V"))
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text(String(data.victories))
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .lineLimit(__designTimeInteger("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: 1))
                                }
                                .frame(width: __designTimeInteger("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 35), alignment: .center)
                                
                                VStack {
                                    Text(__designTimeString("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "E"))
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text(String(data.draws))
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .frame(width: __designTimeInteger("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 30), alignment: .center)
                                
                                VStack {
                                    Text(__designTimeString("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[2].arg[0].value.[0].arg[0].value", fallback: "D"))
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text(String(data.defeats))
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .frame(width: __designTimeInteger("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[2].modifier[0].arg[0].value", fallback: 30), alignment: .center)
                            }
                            Spacer()
                            VStack {
                                Text(__designTimeString("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value.[2].arg[0].value.[0].arg[0].value", fallback: "Puntos"))
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(String(data.points))
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                        
                        }
                    }
                }
                .padding(.leading, __designTimeInteger("#10880.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 10))
            }
            .padding(__designTimeInteger("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 20))
            .frame(width: geometry.size.width)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: __designTimeFloat("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[0].arg[0].value", fallback: 0.854), green: __designTimeFloat("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[0].arg[1].value", fallback: 0.000), blue: __designTimeFloat("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[0].arg[2].value", fallback: 0.176), opacity: __designTimeFloat("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[0].arg[3].value", fallback: 0.85)),
                                                Color(red: __designTimeFloat("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[1].arg[0].value", fallback: 0.882), green: __designTimeFloat("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[1].arg[1].value", fallback: 0.341), blue: __designTimeFloat("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[1].arg[2].value", fallback: 0.008), opacity: __designTimeFloat("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value.arg[0].value.[1].arg[3].value", fallback: 0.85))]),
                    startPoint: .bottom,
                    endPoint: .top)
            )
            .cornerRadius(__designTimeInteger("#10880.[1].[1].property.[0].[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: 10))
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.DetailTeamCard
#Preview {
    DetailTeamCard(data: TeamDetails(tournamentId: "22e92ec7-3ac6-48f5-96f9-c455a6d1ae8c", schoolId: "1", schoolName: "Nombre de equipo", defeats: 2, draws: 1, victories: 4, goalsFor: 10, goalsAgainst: 5, goalDifference: 5, gamesPlayed: 7, points: 12, position: 3, shieldFileName: "escudo-depor-cali.png"))
}



