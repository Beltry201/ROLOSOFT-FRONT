//
//  SearchVieq.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 17/05/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var selectedTab = 0
    @State private var teams: [School] = []
    @State private var players: [Student] = []
    @StateObject private var apiService = APIService()

    var filteredTeams: [School] {
        if searchText.isEmpty {
            return teams
        } else {
            return teams.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var filteredPlayers: [Student] {
        if searchText.isEmpty {
            return players
        } else {
            return players.filter { "\($0.firstName) \($0.lastName)".localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchHeader(teams: $teams, players: $players, searchText: $searchText, selectedTab: $selectedTab, apiService: apiService)
                    .padding(.top, 8)
                TabView(selection: $selectedTab) {
                    // Tab 1: Equipos
                    VStack {
                        if filteredTeams.isEmpty {
                            Text("No encontramos al equipo \(searchText)")
                                .foregroundColor(.gray)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                        } else {
                            List(filteredTeams) { team in
                                TeamRow(team: team)
                            }
                        }
                    }
                    .tag(0)

                    // Tab 2: Jugadores
                    VStack {
                        if filteredPlayers.isEmpty {
                            Text("No encontramos al jugador \(searchText)")
                                .foregroundColor(.gray)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                        } else {
                            List(filteredPlayers) { player in
                                PlayerRow(player: player)
                            }
                        }
                    }
                    .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onChange(of: selectedTab) { _ in
                    Task {
                        await search()
                    }
                }
                .padding(.top, -8) // Adjust negative top padding to align content properly
            }
            .onAppear {
                Task {
                    await search()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func search() async {
        let tournamentId = UserDefaults.standard.string(forKey: "tournamentId") ?? ""
        let token = UserDefaults.standard.string(forKey: "jwtToken") ?? ""

        apiService.searchStudentsAndSchools(tournamentId: tournamentId, token: token, query: searchText) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.teams = data.schools
                    self.players = data.students
                case .failure(let error):
                    print("Search error: \(error)")
                }
            }
        }
    }
}

struct SearchHeader: View {
    @Binding var teams: [School]
    @Binding var players: [Student]
    @Binding var searchText: String
    @Binding var selectedTab: Int
    @StateObject var apiService: APIService

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Buscar en el torneo")
                .font(.custom("", size: 24))
                .padding(.horizontal, 10)
                .padding(.top, 20)

            HStack {
                TextField("Search", text: $searchText, onCommit: {
                    Task {
                        await search()
                    }
                })
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if !searchText.isEmpty {
                            Button(action: {
                                self.searchText = ""
                                Task {
                                    await search()
                                }
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
            }

            HStack {
                Spacer()
                TabBarButton(title: "Equipos", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                .padding(.horizontal, 16)
                Spacer()
                TabBarButton(title: "Jugadores", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                .padding(.horizontal, 16)
                Spacer()
            }
            .padding(.top, 8)
        }
    }

    private func search() async {
        let tournamentId = UserDefaults.standard.string(forKey: "tournamentId") ?? ""
        let token = UserDefaults.standard.string(forKey: "jwtToken") ?? ""

        apiService.searchStudentsAndSchools(tournamentId: tournamentId, token: token, query: searchText) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    print("\n-- SEARCH DATA: ", data)
                    self.teams = data.schools
                    self.players = data.students
                case .failure(let error):
                    print("Search error: \(error)")
                }
            }
        }
    }
}

struct TabBarButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        VStack {
            Text(title)
                .fontWeight(isSelected ? .regular : .light)
                .foregroundColor(isSelected ? .black : .gray)
            Rectangle()
                .foregroundColor(isSelected ? .red : .clear)
                .frame(height: 2)
                .padding(.top, 4)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
}

struct TeamRow: View {
    let team: School
    @State private var teamDetails: TeamDetails?

    var body: some View {
        NavigationLink(destination: TeamDetailView(teamDetails: teamDetails)) {
            HStack {
                URLImage(url: team.fullTeamPictureUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)

                Spacer()

                Text(team.name)

                Spacer()

                VStack(alignment: .center) {
                    Text("\(team.points)")
                    Text("puntos")
                        .font(.caption)
                }
            }
        }
        .onTapGesture {
            fetchTeamDetails()
        }
    }

    private func fetchTeamDetails() {
        guard let tournamentId = UserDefaults.standard.string(forKey: "tournamentId"),
              let token = UserDefaults.standard.string(forKey: "jwtToken") else {
            print("Tournament ID or token not found in UserDefaults")
            return
        }
        
        // Fetch Team Details
        APIService().fetchTeamDetails(tournamentId: tournamentId, teamId: team.id, token: token) { result in
            switch result {
            case .success(let teamDetails):
                print("Fetched Team Details: \(teamDetails)")
                self.teamDetails = teamDetails
            case .failure(let error):
                print("Error fetching team details: \(error)")
            }
        }
    }
}


struct PlayerRow: View {
    let player: Student

    var body: some View {
        HStack {
            URLImage(url: player.fullPictureUrl)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)

            Spacer()

            Text("\(player.firstName) \(player.lastName)")

            Spacer()

            VStack(alignment: .center) {
                Text("\(player.greenCards)")
                Text("puntos")
                    .font(.caption)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
