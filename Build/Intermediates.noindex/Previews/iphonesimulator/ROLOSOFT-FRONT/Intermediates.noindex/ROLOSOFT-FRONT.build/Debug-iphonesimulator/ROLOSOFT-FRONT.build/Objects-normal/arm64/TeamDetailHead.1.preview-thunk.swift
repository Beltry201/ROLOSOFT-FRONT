@_private(sourceFile: "TeamDetailHead.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension TeamDetailHead {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/TeamDetailHead.swift", line: 24)
        VStack {
            VStack {
                URLImage(url: logoUrl)
                    .frame(width: /*@START_MENU_TOKEN@*/__designTimeInteger("#5911.[1].[11].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 100)/*@END_MENU_TOKEN@*/)
                Text(name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding(.bottom, __designTimeInteger("#5911.[1].[11].property.[0].[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 24))
            Grid (horizontalSpacing: __designTimeInteger("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: 20), verticalSpacing: __designTimeInteger("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[1].value", fallback: 20)) {
                GridRow {
                    VStack {
                        Text(String(df))
                            .fontWeight(.bold)
                        Text(__designTimeString("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "DF"))
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(jj))
                            .fontWeight(.bold)
                        Text(__designTimeString("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[2].arg[0].value.[1].arg[0].value", fallback: "JJ"))
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(jg))
                            .fontWeight(.bold)
                        Text(__designTimeString("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[4].arg[0].value.[1].arg[0].value", fallback: "JG"))
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(pt))
                            .fontWeight(.bold)
                        Text(__designTimeString("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[6].arg[0].value.[1].arg[0].value", fallback: "PT"))
                            .font(.caption)
                    }
                }
                GridRow {
                    VStack {
                        Text(String(je))
                            .fontWeight(.bold)
                        Text(__designTimeString("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[2].value.[1].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "JE"))
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(jp))
                            .fontWeight(.bold)
                        Text(__designTimeString("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[2].value.[1].arg[0].value.[2].arg[0].value.[1].arg[0].value", fallback: "JP"))
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(gf))
                            .fontWeight(.bold)
                        Text(__designTimeString("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[2].value.[1].arg[0].value.[4].arg[0].value.[1].arg[0].value", fallback: "GF"))
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(gc))
                            .fontWeight(.bold)
                        Text(__designTimeString("#5911.[1].[11].property.[0].[0].arg[0].value.[1].arg[2].value.[1].arg[0].value.[6].arg[0].value.[1].arg[0].value", fallback: "GC"))
                            .font(.caption)
                    }
                }
            }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.TeamDetailHead
#Preview {
    TeamDetailHead(logoUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", position: 2, name: "Independiente Santa Fe", df: 2, jj: 10, jg: 10, pt: 30, je: 0, jp: 0, gf: 20, gc: 5)
}



