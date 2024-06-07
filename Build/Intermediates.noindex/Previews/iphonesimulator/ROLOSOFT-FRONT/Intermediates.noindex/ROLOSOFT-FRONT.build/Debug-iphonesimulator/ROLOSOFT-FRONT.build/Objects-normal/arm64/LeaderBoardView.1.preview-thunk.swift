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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 177)
        LeaderBoardView()
    
#sourceLocation()
    }
}

extension LeaderBoardHeader {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 156)
        VStack(alignment: .leading, spacing: __designTimeInteger("#10267.[2].[1].property.[0].[0].arg[1].value", fallback: 0)) {
            HStack {
                Spacer()
                TabBarButton(title: __designTimeString("#10267.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[1].arg[0].value", fallback: "Tabla general"), isSelected: selectedTab == __designTimeInteger("#10267.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[1].arg[1].value.[0]", fallback: 0)) {
                    selectedTab = __designTimeInteger("#10267.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[1].arg[2].value.[0].[0]", fallback: 0)
                }
                .padding(.horizontal, __designTimeInteger("#10267.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 16))
                Spacer()
                TabBarButton(title: __designTimeString("#10267.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[3].arg[0].value", fallback: "Tabla de goleo"), isSelected: selectedTab == __designTimeInteger("#10267.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[3].arg[1].value.[0]", fallback: 1)) {
                    selectedTab = __designTimeInteger("#10267.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[3].arg[2].value.[0].[0]", fallback: 1)
                }
                .padding(.horizontal, __designTimeInteger("#10267.[2].[1].property.[0].[0].arg[2].value.[0].arg[0].value.[3].modifier[0].arg[1].value", fallback: 16))
                Spacer()
            }
            .padding(.top, __designTimeInteger("#10267.[2].[1].property.[0].[0].arg[2].value.[0].modifier[0].arg[1].value", fallback: 8))
        }
    
#sourceLocation()
    }
}

extension LeaderBoardView {
    @_dynamicReplacement(for: fetchTeamDetail(teamId:)) private func __preview__fetchTeamDetail(teamId: String) {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 131)
        
        print("\n-- LOOKING FOR TEAM: \(teamId)")
        let tournamentId = UserDefaults.standard.string(forKey: __designTimeString("#10267.[1].[9].[1].value.[0]", fallback: "tournamentId")) ?? __designTimeString("#10267.[1].[9].[1].value.[1]", fallback: "")
        let token = UserDefaults.standard.string(forKey: __designTimeString("#10267.[1].[9].[2].value.[0]", fallback: "jwtToken")) ?? __designTimeString("#10267.[1].[9].[2].value.[1]", fallback: "")

        apiService.fetchTeamDetails(tournamentId: tournamentId, teamId: teamId, token: token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let teamDetail):
                    self.selectedTeamDetail = teamDetail
                    self.showTeamDetail = __designTimeBoolean("#10267.[1].[9].[3].modifier[0].arg[3].value.[0].modifier[0].arg[0].value.[0].[0].[1].[0]", fallback: true)
                case .failure(let error):
                    print("Error fetching team details: \(error)")
                }
            }
        }
    
#sourceLocation()
    }
}

extension LeaderBoardView {
    @_dynamicReplacement(for: loadData()) private func __preview__loadData() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 73)
        let tournamentId = UserDefaults.standard.string(forKey: __designTimeString("#10267.[1].[8].[0].value.[0]", fallback: "tournamentId")) ?? __designTimeString("#10267.[1].[8].[0].value.[1]", fallback: "")
        let token = UserDefaults.standard.string(forKey: __designTimeString("#10267.[1].[8].[1].value.[0]", fallback: "jwtToken")) ?? __designTimeString("#10267.[1].[8].[1].value.[1]", fallback: "")
        
        let group = DispatchGroup()
        
        var fetchedTeams: [GeneralTableTeam] = []
        var fetchedPlayers: [GoalTablePlayer] = []

        group.enter()
        apiService.fetchLeaderBoard(tournamentId: tournamentId, token: token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let teamData):
                    fetchedTeams = teamData.map { team in
                        GeneralTableTeam(
                            name: team.team,
                            logo: team.photoUrl,
                            d: team.defeats,
                            e: team.draws,
                            v: team.victories,
                            isMyTeam: __designTimeBoolean("#10267.[1].[8].[6].modifier[0].arg[2].value.[0].modifier[0].arg[0].value.[0].[0].[0].[0]", fallback: false)
                        )
                    }
                case .failure(let error):
                    print("Error fetching leaderboard: \(error)")
                }
                group.leave()
            }
        }

        group.enter()
        apiService.fetchScoringTable(tournamentId: tournamentId, token: token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let tableData):
                    fetchedPlayers = tableData.map { playerData in
                        GoalTablePlayer(
                            imgUrl: playerData.playerPhotoUrl,
                            name: "\(playerData.firstName) \(playerData.lastName)",
                            goals: playerData.goals,
                            teamImgUrl: playerData.teamPhotoUrl
                        )
                    }
                case .failure(let error):
                    print("Error fetching scoring table: \(error)")
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.generalTeams = fetchedTeams
            self.scoringTable = fetchedPlayers
            self.isDataLoaded = __designTimeBoolean("#10267.[1].[8].[9].modifier[0].arg[1].value.[2].[0]", fallback: true)
        }
    
#sourceLocation()
    }
}

extension LeaderBoardView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/LeaderBoardView.swift", line: 20)
        NavigationView {
            VStack {
                LeaderBoardHeader(selectedTab: $selectedTab)
                    .padding(.top, __designTimeInteger("#10267.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 8))
                if isDataLoaded {
                    TabView(selection: $selectedTab) {
                        // Tab 1: GeneralTable
                        VStack {
                            if generalTeams.isEmpty {
                                Text(__designTimeString("#10267.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value.[0].[0].[0].arg[0].value", fallback: "No encontramos información"))
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                GeneralTable(teams: generalTeams) { team in
                                    fetchTeamDetail(teamId: team.id.uuidString)
                                }
                            }
                        }
                        .tag(__designTimeInteger("#10267.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: 0))
                        
                        // Tab 2: GoalTable
                        VStack {
                            if scoringTable.isEmpty {
                                Text(__designTimeString("#10267.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[1].arg[0].value.[0].[0].[0].arg[0].value", fallback: "No encontramos información"))
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                GoalTable(players: scoringTable)
                            }
                        }
                        .tag(__designTimeInteger("#10267.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[1].modifier[0].arg[0].value", fallback: 1))
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top, __designTimeInteger("#10267.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].modifier[1].arg[1].value", fallback: -8))
                } else {
                    ProgressView(__designTimeString("#10267.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[1].[0].arg[0].value", fallback: "Loading data..."))
                }
            }
            .onAppear {
                loadData()
            }
            .sheet(isPresented: $showTeamDetail) {
                if let teamDetail = selectedTeamDetail {
                    TeamDetailView(teamDetails: teamDetail)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.LeaderBoardView
import struct ROLOSOFT_FRONT.LeaderBoardHeader
import struct ROLOSOFT_FRONT.LeaderBoardView_Previews

