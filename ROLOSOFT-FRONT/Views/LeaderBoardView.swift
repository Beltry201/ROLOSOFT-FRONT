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
    @State private var selectedTeamDetail: TeamDetails?

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
                                List {
                                    // Header Row
                                    HStack {
                                        Text("Equipo").padding()
                                        Spacer()
                                        Grid(horizontalSpacing: 28) {
                                            GridRow {
                                                Text("D")//.padding(.horizontal, 18)
                                                Text("E")//.padding(.horizontal, 18)
                                                Text("V")//.padding(.horizontal, 18)
                                            }
                                        }
                                        .padding(.trailing, 8)
                                    }
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    //.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

                                    // Data Rows
                                    ForEach(generalTeams) { team in
                                        GeneralTableRow(team: team).padding()
                                    }
                                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                }
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
                    .padding(.top, -8)
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
                            isMyTeam: false
                        )
                    }
                    self.isDataLoaded = true
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
                    self.isDataLoaded = true
                case .failure(let error):
                    print("Error fetching scoring table: \(error)")
                }
            }
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

struct GeneralTableRow: View {
    var team: GeneralTableTeam

    var body: some View {
        NavigationLink(destination: TeamDetailView(teamId: team.id)) {
            HStack {
                URLImage(url: team.logo)
                    .frame(width: 30, height: 30)
                    .cornerRadius(8)
                    .clipped()
                Text(team.name)
                    .font(.headline)
                    .foregroundColor(team.isMyTeam ? .white : .black)
                Spacer()
                Grid(horizontalSpacing: 28) {
                    GridRow {
                        Text("\(team.d)")
                            .font(.subheadline)
                            .foregroundColor(team.isMyTeam ? .white : .black)
                            //.padding(.horizontal, 18)
                        Text("\(team.e)")
                            .font(.subheadline)
                            .foregroundColor(team.isMyTeam ? .white : .black)
                        Text("\(team.v)")
                            .font(.subheadline)
                            .foregroundColor(team.isMyTeam ? .white : .black)
                    }
                    
                }
            }
        }
        .padding(.vertical, 8)
        .cornerRadius(8)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
