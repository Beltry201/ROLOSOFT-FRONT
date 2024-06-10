@_private(sourceFile: "SearchView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension SearchView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 287)
        SearchView()
    
#sourceLocation()
    }
}

extension PlayerRow {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 265)
        HStack {
            URLImage(url: player.fullPictureUrl)
                .aspectRatio(contentMode: .fit)
                .frame(width: __designTimeInteger("#5127.[5].[1].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 50))

            Spacer()

            Text("\(player.firstName) \(player.lastName)")

            Spacer()

            VStack(alignment: .center) {
                Text("\(player.greenCards)")
                Text(__designTimeString("#5127.[5].[1].property.[0].[0].arg[0].value.[4].arg[1].value.[1].arg[0].value", fallback: "puntos"))
                    .font(.caption)
            }
        }
    
#sourceLocation()
    }
}

extension TeamRow {
    @_dynamicReplacement(for: fetchTeamDetails()) private func __preview__fetchTeamDetails() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 241)
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
    
#sourceLocation()
    }
}

extension TeamRow {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 216)
        NavigationLink(destination: TeamDetailView(teamDetails: teamDetails)) {
            HStack {
                URLImage(url: team.fullTeamPictureUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: __designTimeInteger("#5127.[4].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 50))

                Spacer()

                Text(team.name)

                Spacer()

                VStack(alignment: .center) {
                    Text("\(team.points)")
                    Text(__designTimeString("#5127.[4].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[4].arg[1].value.[1].arg[0].value", fallback: "puntos"))
                        .font(.caption)
                }
            }
        }
        .onTapGesture {
            fetchTeamDetails()
        }
    
#sourceLocation()
    }
}

extension TabBarButton {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 195)
        VStack {
            Text(title)
                .fontWeight(isSelected ? .regular : .light)
                .foregroundColor(isSelected ? .black : .gray)
            Rectangle()
                .foregroundColor(isSelected ? .red : .clear)
                .frame(height: __designTimeInteger("#5127.[3].[3].property.[0].[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 2))
                .padding(.top, __designTimeInteger("#5127.[3].[3].property.[0].[0].arg[0].value.[1].modifier[2].arg[1].value", fallback: 4))
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    
#sourceLocation()
    }
}

extension SearchHeader {
    @_dynamicReplacement(for: search()) private func __preview__search() async {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 171)
        let tournamentId = UserDefaults.standard.string(forKey: __designTimeString("#5127.[2].[6].[0].value.[0]", fallback: "tournamentId")) ?? __designTimeString("#5127.[2].[6].[0].value.[1]", fallback: "")
        let token = UserDefaults.standard.string(forKey: __designTimeString("#5127.[2].[6].[1].value.[0]", fallback: "jwtToken")) ?? __designTimeString("#5127.[2].[6].[1].value.[1]", fallback: "")

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
    
#sourceLocation()
    }
}

extension SearchHeader {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 112)
        VStack(alignment: .leading, spacing: __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[1].value", fallback: 0)) {
            Text(__designTimeString("#5127.[2].[5].property.[0].[0].arg[2].value.[0].arg[0].value", fallback: "Buscar en el torneo"))
                .font(.custom(__designTimeString("#5127.[2].[5].property.[0].[0].arg[2].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: ""), size: __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 24)))
                .padding(.horizontal, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[0].modifier[1].arg[1].value", fallback: 10))
                .padding(.top, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[0].modifier[2].arg[1].value", fallback: 20))

            HStack {
                TextField(__designTimeString("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].arg[0].value", fallback: "Search"), text: $searchText, onCommit: {
                    Task {
                        await search()
                    }
                })
                .padding(__designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[0].arg[0].value", fallback: 7))
                .padding(.horizontal, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[1].arg[1].value", fallback: 25))
                .background(Color(.systemGray6))
                .cornerRadius(__designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[3].arg[0].value", fallback: 8))
                .overlay(
                    HStack {
                        Image(systemName: __designTimeString("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].arg[0].value", fallback: "magnifyingglass"))
                            .foregroundColor(.gray)
                            .frame(minWidth: __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[1].arg[0].value", fallback: 0), maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[2].arg[1].value", fallback: 8))

                        if !searchText.isEmpty {
                            Button(action: {
                                self.searchText = __designTimeString("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[1].[0].[0].arg[0].value.[0].[0]", fallback: "")
                                Task {
                                    await search()
                                }
                            }) {
                                Image(systemName: __designTimeString("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value", fallback: "multiply.circle.fill"))
                                    .foregroundColor(.gray)
                                    .padding(.trailing, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[1].[0].[0].arg[1].value.[0].modifier[1].arg[1].value", fallback: 8))
                            }
                        }
                    }
                )
                .padding(.horizontal, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[5].arg[1].value", fallback: 10))
                .padding(.vertical, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[1].arg[0].value.[0].modifier[6].arg[1].value", fallback: 15))
            }

            HStack {
                Spacer()
                TabBarButton(title: __designTimeString("#5127.[2].[5].property.[0].[0].arg[2].value.[2].arg[0].value.[1].arg[0].value", fallback: "Equipos"), isSelected: selectedTab == __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[2].arg[0].value.[1].arg[1].value.[0]", fallback: 0)) {
                    selectedTab = __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[2].arg[0].value.[1].arg[2].value.[0].[0]", fallback: 0)
                }
                .padding(.horizontal, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[2].arg[0].value.[1].modifier[0].arg[1].value", fallback: 16))
                Spacer()
                TabBarButton(title: __designTimeString("#5127.[2].[5].property.[0].[0].arg[2].value.[2].arg[0].value.[3].arg[0].value", fallback: "Jugadores"), isSelected: selectedTab == __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[2].arg[0].value.[3].arg[1].value.[0]", fallback: 1)) {
                    selectedTab = __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[2].arg[0].value.[3].arg[2].value.[0].[0]", fallback: 1)
                }
                .padding(.horizontal, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[2].arg[0].value.[3].modifier[0].arg[1].value", fallback: 16))
                Spacer()
            }
            .padding(.top, __designTimeInteger("#5127.[2].[5].property.[0].[0].arg[2].value.[2].modifier[0].arg[1].value", fallback: 8))
        }
    
#sourceLocation()
    }
}

extension SearchView {
    @_dynamicReplacement(for: search()) private func __preview__search() async {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 87)
        let tournamentId = UserDefaults.standard.string(forKey: __designTimeString("#5127.[1].[8].[0].value.[0]", fallback: "tournamentId")) ?? __designTimeString("#5127.[1].[8].[0].value.[1]", fallback: "")
        let token = UserDefaults.standard.string(forKey: __designTimeString("#5127.[1].[8].[1].value.[0]", fallback: "jwtToken")) ?? __designTimeString("#5127.[1].[8].[1].value.[1]", fallback: "")

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
    
#sourceLocation()
    }
}

extension SearchView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 34)
        NavigationView {
            VStack {
                SearchHeader(teams: $teams, players: $players, searchText: $searchText, selectedTab: $selectedTab, apiService: apiService)
                    .padding(.top, __designTimeInteger("#5127.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 8))
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
                    .tag(__designTimeInteger("#5127.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[0].value", fallback: 0))

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
                    .tag(__designTimeInteger("#5127.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[1].modifier[0].arg[0].value", fallback: 1))
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onChange(of: selectedTab) { _ in
                    Task {
                        await search()
                    }
                }
                .padding(.top, __designTimeInteger("#5127.[1].[7].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[2].arg[1].value", fallback: -8)) // Adjust negative top padding to align content properly
            }
            .onAppear {
                Task {
                    await search()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    
#sourceLocation()
    }
}

extension SearchView {
    @_dynamicReplacement(for: filteredPlayers) private var __preview__filteredPlayers: [Student] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 26)
        if searchText.isEmpty {
            return players
        } else {
            return players.filter { "\($0.firstName) \($0.lastName)".localizedCaseInsensitiveContains(searchText) }
        }
    
#sourceLocation()
    }
}

extension SearchView {
    @_dynamicReplacement(for: filteredTeams) private var __preview__filteredTeams: [School] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 18)
        if searchText.isEmpty {
            return teams
        } else {
            return teams.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.SearchView
import struct ROLOSOFT_FRONT.SearchHeader
import struct ROLOSOFT_FRONT.TabBarButton
import struct ROLOSOFT_FRONT.TeamRow
import struct ROLOSOFT_FRONT.PlayerRow
import struct ROLOSOFT_FRONT.SearchView_Previews

