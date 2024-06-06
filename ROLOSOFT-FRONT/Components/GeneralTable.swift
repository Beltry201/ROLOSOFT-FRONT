//
//  GeneralTable.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 28/05/24.
//

import SwiftUI

struct GeneralTable: View {
    var teams: [GeneralTableTeam]
    var onSelectTeam: (GeneralTableTeam) -> Void

    struct ListItemBg: ViewModifier {
        var isMyTeam: Bool? = false
        
        func body(content: Content) -> some View {
            if let isMyTeam = isMyTeam, isMyTeam {
                return AnyView(content
                    .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color(red: 0.854, green: 0.000, blue: 0.176, opacity: 0.85), Color(red: 0.882, green: 0.341, blue: 0.008, opacity: 0.85)]), startPoint: .bottom, endPoint: .top))
                )
            } else {
                return AnyView(content
                    .listRowBackground(Color.white)
                )
            }
        }
    }
    
    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Equipo").padding()
                    Spacer()
                    Text("D").padding(.horizontal, 18)
                    Text("E").padding(.horizontal, 18)
                    Text("V").padding(.horizontal, 18)
                }
                .font(.headline)
                .listRowInsets(EdgeInsets.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                ForEach(teams.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + 1)")
                            .font(.headline)
                            .foregroundColor(teams[index].isMyTeam ? .white : .black)
                        URLImage(url: teams[index].logo)
                            .frame(width: 30, height: 30)
                            .cornerRadius(8)
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
                    .cornerRadius(8)
                    .listRowInsets(EdgeInsets.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .onTapGesture {
                        onSelectTeam(teams[index])
                    }
                }
            }
        }
    }
}

//
//struct GeneralTable_Previews: PreviewProvider {
//    static var previews: some View {
//        GeneralTable(teams: [])
//    }
//}
