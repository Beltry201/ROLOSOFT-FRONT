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
        VStack(alignment: .leading) {
            Text("Buscar en el torneo")
                .font(.custom("", size: 24))
                .padding(.horizontal, 10)
                .padding(.top, 20)
            
            HStack {
                TextField("Search", text: $searchText, onCommit: {
                    search()
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
                                    search() // Perform search with empty text
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .padding(.top, 0)
            }
            
            HStack {
                Spacer()
                VStack {
                    Text("Equipos")
                        .fontWeight(selectedTab == 0 ? .regular : .light)
                        .overlay(
                            GeometryReader { geometry in
                                Rectangle()
                                    .foregroundColor(selectedTab == 0 ? .red : .clear)
                                    .frame(height: 2)
                                    .offset(y: geometry.size.height - 2)
                            }
                        )
                        .onTapGesture {
                            selectedTab = 0
                        }
                }
                Spacer()
                VStack {
                    Text("Jugadores")
                        .fontWeight(selectedTab == 1 ? .regular : .light)
                        .overlay(
                            GeometryReader { geometry in
                                Rectangle()
                                    .foregroundColor(selectedTab == 1 ? .red : .clear)
                                    .frame(height: 2)
                                    .offset(y: geometry.size.height - 2)
                            }
                        )
                        .onTapGesture {
                            selectedTab = 1
                        }
                }
                Spacer()
            }
            .padding(.top)
            
            TabView(selection: $selectedTab) {
                VStack {
                    if filteredTeams.isEmpty {
                        Text("No encontramos al equipo \(searchText)")
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        List(filteredTeams) { team in
                            HStack {
                                URLImage(url: team.logoUrl)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                
                                Spacer()
                                
                                Text(team.name)
                                
                                Spacer()
                                
                                VStack(alignment: .center) {
                                    Text("\(team.points)") // Convert points to string
                                    Text("puntos")
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
                .tag(0)
                
                VStack {
                    if filteredPlayers.isEmpty {
                        Text("No encontramos al jugador \(searchText)")
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        List(filteredPlayers) { player in
                            HStack {
                                URLImage(url: player.studentPhotoUrl)
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
                }
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .navigationTitle("Search")
        .onAppear {
            search()
        }
    }

    private func search() {
        let tournamentId = UserDefaults.standard.string(forKey: "tournamentId") ?? ""
        let token = UserDefaults.standard.string(forKey: "jwtToken") ?? ""
        
        print("\n-- TID:", tournamentId)
        print("\n-- TOKEN:", token)
        
        apiService.searchStudentsAndSchools(tournamentId: tournamentId, token: token, query: searchText) { result in
            DispatchQueue.main.async {
                print("\n-- RESULT:", result)
                switch result {
                case .success(let data):
                    print("\n-- DATA: ", data)
                    self.teams = data.schools
                    self.players = data.students
                case .failure(let error):
                    print("Search error: \(error)")
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
