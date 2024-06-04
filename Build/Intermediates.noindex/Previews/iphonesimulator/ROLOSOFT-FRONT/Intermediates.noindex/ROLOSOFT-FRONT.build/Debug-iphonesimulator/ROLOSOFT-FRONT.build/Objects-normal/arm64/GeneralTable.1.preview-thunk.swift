@_private(sourceFile: "GeneralTable.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension GeneralTable_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/GeneralTable.swift", line: 89)
        GeneralTable(teams: [])
    
#sourceLocation()
    }
}

extension GeneralTable {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/GeneralTable.swift", line: 40)
        VStack {
            List {
                HStack {
                    Text(__designTimeString("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Equipo")).padding()
                    Spacer()
                    Text(__designTimeString("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].arg[0].value", fallback: "D")).padding(.horizontal, __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].modifier[0].arg[1].value", fallback: 18))
                    Text(__designTimeString("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].arg[0].value", fallback: "E")).padding(.horizontal, __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].modifier[0].arg[1].value", fallback: 18))
                    Text(__designTimeString("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[4].arg[0].value", fallback: "V")).padding(.horizontal, __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[4].modifier[0].arg[1].value", fallback: 18))
                }
                .font(.headline)
                .listRowInsets(EdgeInsets.init(top: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value", fallback: 10), leading: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[0].value.arg[1].value", fallback: 0), bottom: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[0].value.arg[2].value", fallback: 10), trailing: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[0].value.arg[3].value", fallback: 0)))
                
                ForEach(teams.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[0].arg[0].value.[1].value.arg[0].value.[0]", fallback: 1))")
                            .font(.headline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                        URLImage(url: teams[index].logo)
                            .frame(width: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 30), height: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 30))
                            .cornerRadius(__designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 8))
                            .clipped()
                        Text(teams[index].name)
                            .font(.headline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                        Spacer()
                        Text("\(teams[index].d)")
                            .font(.subheadline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                        Spacer()
                        Text("\(teams[index].e)")
                            .font(.subheadline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                        Spacer()
                        Text("\(teams[index].v)")
                            .font(.subheadline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                    }
                    .padding()
                    .modifier(ListItemBg(isMyTeam: teams[index].isMyTeam))
                    .cornerRadius(__designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[2].arg[0].value", fallback: 8))
                    .listRowInsets(EdgeInsets.init(top: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[3].arg[0].value.arg[0].value", fallback: 10), leading: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[3].arg[0].value.arg[1].value", fallback: 0), bottom: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[3].arg[0].value.arg[2].value", fallback: 10), trailing: __designTimeInteger("#1959.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[3].arg[0].value.arg[3].value", fallback: 0)))
                }
            }
        }
    
#sourceLocation()
    }
}

extension GeneralTable.ListItemBg {
typealias ListItemBg = GeneralTable.ListItemBg

    @_dynamicReplacement(for: body(content:)) private func __preview__body(content: Content) -> some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/GeneralTable.swift", line: 27)
            if let isMyTeam = isMyTeam, isMyTeam {
                return AnyView(content
                    .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color(red: __designTimeFloat("#1959.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[0].value", fallback: 0.854), green: __designTimeFloat("#1959.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[1].value", fallback: 0.000), blue: __designTimeFloat("#1959.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[2].value", fallback: 0.176), opacity: __designTimeFloat("#1959.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[3].value", fallback: 0.85)), Color(red: __designTimeFloat("#1959.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[0].value", fallback: 0.882), green: __designTimeFloat("#1959.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[1].value", fallback: 0.341), blue: __designTimeFloat("#1959.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[2].value", fallback: 0.008), opacity: __designTimeFloat("#1959.[2].[1].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[3].value", fallback: 0.85))]), startPoint: .bottom, endPoint: .top))
                )
            } else {
                return AnyView(content
                    .listRowBackground(Color.white)
                )
            }
        
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.GeneralTableTeam
import struct ROLOSOFT_FRONT.GeneralTable
import struct ROLOSOFT_FRONT.GeneralTable_Previews

