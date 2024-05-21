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

    let teams = ["Team A", "Team B", "Team C"]
    let players = ["Player X", "Player Y", "Player Z"]

    var filteredTeams: [String] {
        if searchText.isEmpty {
            return teams
        } else {
            return teams.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var filteredPlayers: [String] {
        if searchText.isEmpty {
            return players
        } else {
            return players.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            // Header with search bar
            Text("Buscar en el torneo")
                .font(.custom("", size: 24))
                .padding(.horizontal, 10)
                .padding(.top, 20)
            
            HStack {
                TextField("Search", text: $searchText)
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
            
            // Custom Tabs for Teams and Players
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
//            .background(.red)
            
            // List of Items
            List {
                if selectedTab == 0 {
                    ForEach(filteredTeams, id: \.self) { team in
                        Text(team)
                    }
                } else {
                    ForEach(filteredPlayers, id: \.self) { player in
                        Text(player)
                    }
                }
            }
        }
        .navigationTitle("Search")
    }
}

#Preview {
    SearchView()
}
