//
//  TeamDetailHead.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 4/06/24.
//

import SwiftUI

struct TeamDetailHead: View {
    let logoUrl: String
    let position: Int
    let name: String
    let df: Int
    let jj: Int
    let jg: Int
    let pt: Int
    let je: Int
    let jp: Int
    let gf: Int
    let gc: Int
    
    var body: some View {
        VStack {
            VStack {
                URLImage(url: logoUrl)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text(name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding(.bottom, 24)
            Grid (horizontalSpacing: 20, verticalSpacing: 20) {
                GridRow {
                    VStack {
                        Text(String(df))
                            .fontWeight(.bold)
                        Text("DF")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(jj))
                            .fontWeight(.bold)
                        Text("JJ")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(jg))
                            .fontWeight(.bold)
                        Text("JG")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(pt))
                            .fontWeight(.bold)
                        Text("PT")
                            .font(.caption)
                    }
                }
                GridRow {
                    VStack {
                        Text(String(je))
                            .fontWeight(.bold)
                        Text("JE")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(jp))
                            .fontWeight(.bold)
                        Text("JP")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(gf))
                            .fontWeight(.bold)
                        Text("GF")
                            .font(.caption)
                    }
                    Divider()
                    VStack {
                        Text(String(gc))
                            .fontWeight(.bold)
                        Text("GC")
                            .font(.caption)
                    }
                }
            }
        }
    }
}

#Preview {
    TeamDetailHead(logoUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Escudo_de_Independiente_Santa_Fe.png", position: 2, name: "Independiente Santa Fe", df: 2, jj: 10, jg: 10, pt: 30, je: 0, jp: 0, gf: 20, gc: 5)
}
