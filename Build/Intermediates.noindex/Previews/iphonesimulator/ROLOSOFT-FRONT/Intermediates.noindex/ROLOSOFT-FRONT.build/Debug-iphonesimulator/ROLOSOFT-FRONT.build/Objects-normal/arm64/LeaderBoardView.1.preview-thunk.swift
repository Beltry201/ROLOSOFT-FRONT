@_private(sourceFile: "LeaderBoardView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension LeaderBoardView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 119)
        LeaderBoardView()
    
#sourceLocation()
    }
}

extension LeaderBoardView {
    @_dynamicReplacement(for: loadLeaderBoard()) private func __preview__loadLeaderBoard() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 91)
        let tournamentId = UserDefaults.standard.string(forKey: __designTimeString("#2742.[2].[4].[0].value.[0]", fallback: "tournamentId")) ?? __designTimeString("#2742.[2].[4].[0].value.[1]", fallback: "")
        let token = UserDefaults.standard.string(forKey: __designTimeString("#2742.[2].[4].[1].value.[0]", fallback: "jwtToken")) ?? __designTimeString("#2742.[2].[4].[1].value.[1]", fallback: "")

        print("\n-- TID:", tournamentId)
        print("\n-- TOKEN:", token)
        
        apiService.fetchLeaderBoard(tournamentId: tournamentId, token: token) { result in
            switch result {
            case .success(let teamData):
                self.teams = teamData.map { team in
                    LeaderBoardTeam(
                        name: team.team,
                        logo: team.photoUrl,
                        d: team.defeats,
                        e: team.draws,
                        v: team.victories,
                        isMyMatch: __designTimeBoolean("#2742.[2].[4].[4].modifier[0].arg[2].value.[0].[0].[0].[0]", fallback: false) // Update based on your criteria
                    )
                }
            case .failure(let error):
                print("Error fetching leaderboard: \(error)")
            }
        }
    
#sourceLocation()
    }
}

extension LeaderBoardView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 41)
        NavigationView {
            VStack {
                HStack {
                    Text(__designTimeString("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Equipo"))
                    Spacer()
                    Text(__designTimeString("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].arg[0].value", fallback: "D"))
                    Spacer()
                    Text(__designTimeString("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[4].arg[0].value", fallback: "E"))
                    Spacer()
                    Text(__designTimeString("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[6].arg[0].value", fallback: "V"))
                }
                .padding()
                .font(.headline)
                
                List(teams.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + __designTimeInteger("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[0].arg[0].value.[1].value.arg[0].value.[0]", fallback: 1))")
                            .font(.headline)
                            .foregroundColor(teams[index].isMyMatch ? .white : .black)
                        URLImage(url: teams[index].logo)
                            .frame(width: __designTimeInteger("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 30), height: __designTimeInteger("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 30))
                            .cornerRadius(__designTimeInteger("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 8))
                            .clipped()
                        Text(teams[index].name)
                            .font(.headline)
                            .foregroundColor(teams[index].isMyMatch ? .white : .black)
                        Spacer()
                        Text("\(teams[index].d)")
                            .font(.subheadline)
                            .foregroundColor(teams[index].isMyMatch ? .white : .black)
                        Spacer()
                        Text("\(teams[index].e)")
                            .font(.subheadline)
                            .foregroundColor(teams[index].isMyMatch ? .white : .black)
                        Spacer()
                        Text("\(teams[index].v)")
                            .font(.subheadline)
                            .foregroundColor(teams[index].isMyMatch ? .white : .black)
                    }
                    .padding()
                    .modifier(ListItemBg(isMyMatch: teams[index].isMyMatch))
                    .cornerRadius(__designTimeInteger("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[2].arg[0].value", fallback: 8))
                    .listRowInsets(EdgeInsets.init(top: __designTimeInteger("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[3].arg[0].value.arg[0].value", fallback: 10), leading: __designTimeInteger("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[3].arg[0].value.arg[1].value", fallback: 0), bottom: __designTimeInteger("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[3].arg[0].value.arg[2].value", fallback: 10), trailing: __designTimeInteger("#2742.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[2].value.[0].modifier[3].arg[0].value.arg[3].value", fallback: 0)))
                }
                .listStyle(.inset)
            }.onAppear{loadLeaderBoard()}
        }
    
#sourceLocation()
    }
}

extension LeaderBoardView.ListItemBg {
typealias ListItemBg = LeaderBoardView.ListItemBg

    @_dynamicReplacement(for: body(content:)) private func __preview__body(content: Content) -> some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 28)
            if let isMyMatch = isMyMatch, isMyMatch {
                return AnyView(content
                    .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color(red: __designTimeFloat("#2742.[2].[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[0].value", fallback: 0.854), green: __designTimeFloat("#2742.[2].[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[1].value", fallback: 0.000), blue: __designTimeFloat("#2742.[2].[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[2].value", fallback: 0.176), opacity: __designTimeFloat("#2742.[2].[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[0].arg[3].value", fallback: 0.85)), Color(red: __designTimeFloat("#2742.[2].[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[0].value", fallback: 0.882), green: __designTimeFloat("#2742.[2].[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[1].value", fallback: 0.341), blue: __designTimeFloat("#2742.[2].[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[2].value", fallback: 0.008), opacity: __designTimeFloat("#2742.[2].[2].[1].[0].[0].[0].arg[0].value.modifier[0].arg[0].value.arg[0].value.arg[0].value.[1].arg[3].value", fallback: 0.85))]), startPoint: .bottom, endPoint: .top))
                )
            } else {
                return AnyView(content
                    .listRowBackground(Color.white)
                )
            }
        
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.LeaderBoardTeam
import struct ROLOSOFT_FRONT.LeaderBoardView
import struct ROLOSOFT_FRONT.LeaderBoardView_Previews

