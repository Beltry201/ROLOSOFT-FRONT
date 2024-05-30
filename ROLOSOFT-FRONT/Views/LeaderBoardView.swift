//
//  LeaderBoardView.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 27/05/24.
//

import SwiftUI

struct LeaderBoardView: View {
    @State private var selectedTab = 0
    @StateObject var apiService = APIService()
    @State private var generalTeams: [GeneralTableTeam] = []
    @State private var scoringTable: [GoalTablePlayer] = []
    @State private var isDataLoaded = false

    var body: some View {
        NavigationView {
            VStack {
                LeaderBoardHeader(selectedTab: $selectedTab)
                    .padding(.top, 8)
                if isDataLoaded {
                    TabView(selection: $selectedTab) {
                        // Tab 1: GeneralTable
                        VStack {
                            if generalTeams.isEmpty {
                                Text("No encontramos información")
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                GeneralTable(teams: generalTeams)
                            }
                        }
                        .tag(0)
                        
                        // Tab 2: GoalTable
                        VStack {
                            if scoringTable.isEmpty {
                                Text("No encontramos información")
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                GoalTable(players: scoringTable)
                            }
                        }
                        .tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                } else {
                    ProgressView("Loading data...")
                }
            }
            .onAppear {
                loadData()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func loadData() {
        let tournamentId = UserDefaults.standard.string(forKey: "tournamentId") ?? ""
        let token = UserDefaults.standard.string(forKey: "jwtToken") ?? ""
        
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
                            isMyTeam: false
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
            self.isDataLoaded = true
        }
    }
}



struct LeaderBoardHeader: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Spacer()
                TabBarButton(title: "Tabla general", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                .padding(.horizontal, 16)
                Spacer()
                TabBarButton(title: "Tabla de goleo", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                .padding(.horizontal, 16)
                Spacer()
            }
            .padding(.top, 8)
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
