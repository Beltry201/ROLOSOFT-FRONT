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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 190)
        LeaderBoardView()
    
#sourceLocation()
    }
}

extension GeneralTableRow {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 156)
        NavigationLink(destination: TeamDetailView(teamId: team.id)) {
            HStack {
                URLImage(url: team.logo)
                    .frame(width: __designTimeInteger("#9285.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 30), height: __designTimeInteger("#9285.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 30))
                    .cornerRadius(__designTimeInteger("#9285.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 8))
                    .clipped()
                Text(team.name)
                    .font(.headline)
                    .foregroundColor(team.isMyTeam ? .white : .black)
                Spacer()
                Text("\(team.d)")
                    .font(.subheadline)
                    .foregroundColor(team.isMyTeam ? .white : .black)
                    .padding(.horizontal, __designTimeInteger("#9285.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[3].modifier[2].arg[1].value", fallback: 18))
                Spacer()
                Text("\(team.e)")
                    .font(.subheadline)
                    .foregroundColor(team.isMyTeam ? .white : .black)
                    .padding(.horizontal, __designTimeInteger("#9285.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[5].modifier[2].arg[1].value", fallback: 18))
                Spacer()
                Text("\(team.v)")
                    .font(.subheadline)
                    .foregroundColor(team.isMyTeam ? .white : .black)
                    .padding(.horizontal, __designTimeInteger("#9285.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[7].modifier[2].arg[1].value", fallback: 18))
            }
        }
        .padding(.vertical, __designTimeInteger("#9285.[3].[1].property.[0].[0].modifier[0].arg[1].value", fallback: 8))
        .cornerRadius(__designTimeInteger("#9285.[3].[1].property.[0].[0].modifier[1].arg[0].value", fallback: 8))
        .listRowInsets(EdgeInsets(top: __designTimeInteger("#9285.[3].[1].property.[0].[0].modifier[2].arg[0].value.arg[0].value", fallback: 0), leading: __designTimeInteger("#9285.[3].[1].property.[0].[0].modifier[2].arg[0].value.arg[1].value", fallback: 0), bottom: __designTimeInteger("#9285.[3].[1].property.[0].[0].modifier[2].arg[0].value.arg[2].value", fallback: 10), trailing: __designTimeInteger("#9285.[3].[1].property.[0].[0].modifier[2].arg[0].value.arg[3].value", fallback: 0)))
    
#sourceLocation()
    }
}

extension LeaderBoardHeader {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 133)
        VStack(alignment: .leading, spacing: __designTimeInteger("#9285.[2].[1].property.[0].[0].arg[1].value", fallback: 0)) {
            HStack {
                Spacer()
                TabBarButton(title: __designTimeString("#9285.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[1].arg[0].value", fallback: "Tabla general"), isSelected: selectedTab == __designTimeInteger("#9285.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[1].arg[1].value.[0]", fallback: 0)) {
                    selectedTab = __designTimeInteger("#9285.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[1].arg[2].value.[0].[0]", fallback: 0)
                }
                .padding(.horizontal, __designTimeInteger("#9285.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 16))
                Spacer()
                TabBarButton(title: __designTimeString("#9285.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[3].arg[0].value", fallback: "Tabla de goleo"), isSelected: selectedTab == __designTimeInteger("#9285.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[3].arg[1].value.[0]", fallback: 1)) {
                    selectedTab = __designTimeInteger("#9285.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[3].arg[2].value.[0].[0]", fallback: 1)
                }
                .padding(.horizontal, __designTimeInteger("#9285.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[3].modifier[0].arg[1].value", fallback: 16))
                Spacer()
            }
            .padding(.top, __designTimeInteger("#9285.[2].[1].property.[0].[0].arg[2].value.[0].modifier[0].arg[1].value", fallback: 8))
        }
    
#sourceLocation()
    }
}

extension LeaderBoardView {
    @_dynamicReplacement(for: loadData()) private func __preview__loadData() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 83)
        let tournamentId = UserDefaults.standard.string(forKey: __designTimeString("#9285.[1].[7].[0].value.[0]", fallback: "tournamentId")) ?? __designTimeString("#9285.[1].[7].[0].value.[1]", fallback: "")
        let token = UserDefaults.standard.string(forKey: __designTimeString("#9285.[1].[7].[1].value.[0]", fallback: "jwtToken")) ?? __designTimeString("#9285.[1].[7].[1].value.[1]", fallback: "")

        apiService.fetchLeaderBoard(tournamentId: tournamentId, token: token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let teamData):
                    self.generalTeams = teamData.map { team in
                        GeneralTableTeam(
                            id: team.schoolId,
                            name: team.team,
                            logo: "http://34.118.243.66:3000/static/\(team.shieldFileName)",
                            d: team.defeats,
                            e: team.draws,
                            v: team.victories,
                            isMyTeam: __designTimeBoolean("#9285.[1].[7].[2].modifier[0].arg[2].value.[0].modifier[0].arg[0].value.[0].[0].[0].[1]", fallback: false)
                        )
                    }
                    self.isDataLoaded = __designTimeBoolean("#9285.[1].[7].[2].modifier[0].arg[2].value.[0].modifier[0].arg[0].value.[0].[0].[1].[0]", fallback: true)
                case .failure(let error):
                    print("Error fetching leaderboard: \(error)")
                }
            }
        }

        apiService.fetchScoringTable(tournamentId: tournamentId, token: token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let tableData):
                    self.scoringTable = tableData.map { playerData in
                        GoalTablePlayer(
                            imgUrl: "http://34.118.243.66:3000/static/\(playerData.photoFileName)",
                            name: "\(playerData.firstName) \(playerData.lastName)",
                            goals: playerData.goals,
                            teamImgUrl: "http://34.118.243.66:3000/static/\(playerData.shieldFileName)"
                        )
                    }
                    self.isDataLoaded = __designTimeBoolean("#9285.[1].[7].[3].modifier[0].arg[2].value.[0].modifier[0].arg[0].value.[0].[0].[1].[0]", fallback: true)
                case .failure(let error):
                    print("Error fetching scoring table: \(error)")
                }
            }
        }
    
#sourceLocation()
    }
}

extension LeaderBoardView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 19)
        NavigationView {
            VStack {
                LeaderBoardHeader(selectedTab: $selectedTab)
                    .padding(.top, __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 8))
                if isDataLoaded {
                    TabView(selection: $selectedTab) {
                        // Tab 1: GeneralTable
                        VStack {
                            if generalTeams.isEmpty {
                                Text(__designTimeString("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[0].[0].arg[0].value", fallback: "No encontramos información"))
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                List {
                                    // Header Row
                                    HStack {
                                        Text(__designTimeString("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Equipo")).padding()
                                        Spacer()
                                        Text(__designTimeString("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[0].value.[2].arg[0].value", fallback: "D")).padding(.horizontal, __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[0].value.[2].modifier[0].arg[1].value", fallback: 18))
                                        Text(__designTimeString("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[0].value.[3].arg[0].value", fallback: "E")).padding(.horizontal, __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[0].value.[3].modifier[0].arg[1].value", fallback: 18))
                                        Text(__designTimeString("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value", fallback: "V")).padding(.horizontal, __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[0].value.[4].modifier[0].arg[1].value", fallback: 18))
                                    }
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .listRowInsets(EdgeInsets(top: __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[0].value", fallback: 10), leading: __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[1].value", fallback: 0), bottom: __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[2].value", fallback: 0), trailing: __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[2].arg[0].value.arg[3].value", fallback: 0)))

                                    // Data Rows
                                    ForEach(generalTeams) { team in
                                        GeneralTableRow(team: team).padding()
                                    }
                                    .listRowInsets(EdgeInsets(top: __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: 0), leading: __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[1].modifier[0].arg[0].value.arg[1].value", fallback: 0), bottom: __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[1].modifier[0].arg[0].value.arg[2].value", fallback: 10), trailing: __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[1].modifier[0].arg[0].value.arg[3].value", fallback: 0)))
                                }
                            }
                        }
                        .tag(__designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: 0))

                        // Tab 2: GoalTable
                        VStack {
                            if scoringTable.isEmpty {
                                Text(__designTimeString("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[1].arg[0].value.[0].[0].[0].arg[0].value", fallback: "No encontramos información"))
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                GoalTable(players: scoringTable)
                            }
                        }
                        .tag(__designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[1].modifier[0].arg[0].value", fallback: 1))
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top, __designTimeInteger("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].modifier[1].arg[1].value", fallback: -8))
                } else {
                    ProgressView(__designTimeString("#9285.[1].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[1].[0].arg[0].value", fallback: "Loading data..."))
                }
            }
            .onAppear {
                loadData()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.LeaderBoardView
import struct ROLOSOFT_FRONT.LeaderBoardHeader
import struct ROLOSOFT_FRONT.GeneralTableRow
import struct ROLOSOFT_FRONT.LeaderBoardView_Previews

