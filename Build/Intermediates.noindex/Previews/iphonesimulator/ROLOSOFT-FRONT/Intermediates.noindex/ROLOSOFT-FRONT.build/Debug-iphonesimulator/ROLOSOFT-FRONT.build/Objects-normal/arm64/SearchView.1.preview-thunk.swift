@_private(sourceFile: "SearchView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension SearchView {
    @_dynamicReplacement(for: search()) private func __preview__search() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 129)
        let tournamentId = UserDefaults.standard.string(forKey: __designTimeString("#3777.[1].[8].[0].value.[0]", fallback: "tournamentId")) ?? __designTimeString("#3777.[1].[8].[0].value.[1]", fallback: "")
        let token = UserDefaults.standard.string(forKey: __designTimeString("#3777.[1].[8].[1].value.[0]", fallback: "jwtToken")) ?? __designTimeString("#3777.[1].[8].[1].value.[1]", fallback: "")
        
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
    
#sourceLocation()
    }
}

extension SearchView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 35)
        VStack(alignment: .leading) {
            Text(__designTimeString("#3777.[1].[7].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "Buscar en el torneo"))
                .font(.custom(__designTimeString("#3777.[1].[7].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: ""), size: __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 24)))
                .padding(.horizontal, __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[0].modifier[1].arg[1].value", fallback: 10))
                .padding(.top, __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[0].modifier[2].arg[1].value", fallback: 20))
            
            HStack {
                TextField(__designTimeString("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].arg[0].value", fallback: "Search"), text: $searchText, onCommit: {
                    search()
                })
                    .padding(__designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[0].arg[0].value", fallback: 7))
                    .padding(.horizontal, __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[1].arg[1].value", fallback: 25))
                    .background(Color(.systemGray6))
                    .cornerRadius(__designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[3].arg[0].value", fallback: 8))
                    .overlay(
                        HStack {
                            Image(systemName: __designTimeString("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].arg[0].value", fallback: "magnifyingglass"))
                                .foregroundColor(.gray)
                                .frame(minWidth: __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[1].arg[0].value", fallback: 0), maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[2].arg[1].value", fallback: 8))
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    self.searchText = __designTimeString("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[1].[0].[0].arg[0].value.[0].[0]", fallback: "")
                                    search() // Perform search with empty text
                                }) {
                                    Image(systemName: __designTimeString("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value", fallback: "multiply.circle.fill"))
                                        .foregroundColor(.gray)
                                        .padding(.trailing, __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[1].[0].[0].arg[1].value.[0].modifier[1].arg[1].value", fallback: 8))
                                }
                            }
                        }
                    )
                    .padding(.horizontal, __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[5].arg[1].value", fallback: 10))
                    .padding(.top, __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[6].arg[1].value", fallback: 0))
            }
            
            HStack {
                Spacer()
                VStack {
                    Text(__designTimeString("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Equipos"))
                        .fontWeight(selectedTab == __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[0].arg[0].value.if.[0]", fallback: 0) ? .regular : .light)
                        .overlay(
                            GeometryReader { geometry in
                                Rectangle()
                                    .foregroundColor(selectedTab == __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[0].arg[0].value.if.[0]", fallback: 0) ? .red : .clear)
                                    .frame(height: __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[1].arg[0].value", fallback: 2))
                                    .offset(y: geometry.size.height - __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[2].arg[0].value.[0]", fallback: 2))
                            }
                        )
                        .onTapGesture {
                            selectedTab = __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.[0].[0]", fallback: 0)
                        }
                }
                Spacer()
                VStack {
                    Text(__designTimeString("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].arg[0].value", fallback: "Jugadores"))
                        .fontWeight(selectedTab == __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[0].arg[0].value.if.[0]", fallback: 1) ? .regular : .light)
                        .overlay(
                            GeometryReader { geometry in
                                Rectangle()
                                    .foregroundColor(selectedTab == __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[0].arg[0].value.if.[0]", fallback: 1) ? .red : .clear)
                                    .frame(height: __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[1].arg[0].value", fallback: 2))
                                    .offset(y: geometry.size.height - __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[2].arg[0].value.[0]", fallback: 2))
                            }
                        )
                        .onTapGesture {
                            selectedTab = __designTimeInteger("#3777.[1].[7].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[2].arg[0].value.[0].[0]", fallback: 1)
                        }
                }
                Spacer()
            }
            .padding(.top)
            
            List {
                if selectedTab == 0 {
                    ForEach(filteredTeams) { team in
                        
                        Text("\(team.name) \(team.number)")
                    }
                } else {
                    ForEach(filteredPlayers) { player in
                        Text("\(player.firstName) \(player.lastName)")
                    }
                }
            }
        }
        .navigationTitle(__designTimeString("#3777.[1].[7].property.[0].[0].modifier[0].arg[0].value", fallback: "Search"))
        .onAppear {
            search()
        }
    
#sourceLocation()
    }
}

extension SearchView {
    @_dynamicReplacement(for: filteredPlayers) private var __preview__filteredPlayers: [Student] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 27)
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
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 19)
        if searchText.isEmpty {
            return teams
        } else {
            return teams.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.SearchView
#Preview {
    SearchView()
}



