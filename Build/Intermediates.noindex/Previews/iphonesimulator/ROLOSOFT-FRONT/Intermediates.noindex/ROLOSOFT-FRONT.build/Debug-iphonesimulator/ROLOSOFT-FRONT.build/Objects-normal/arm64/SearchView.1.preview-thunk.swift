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
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 34)
        VStack(alignment: .leading) {
            // Header with search bar
            Text(__designTimeString("#6878.[1].[6].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "Buscar en el torneo"))
                .font(.custom(__designTimeString("#6878.[1].[6].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: ""), size: __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 24)))
                .padding(.horizontal, __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[0].modifier[1].arg[1].value", fallback: 10))
                .padding(.top, __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[0].modifier[2].arg[1].value", fallback: 20))
            
            HStack {
                TextField(__designTimeString("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].arg[0].value", fallback: "Search"), text: $searchText)
                    .padding(__designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[0].arg[0].value", fallback: 7))
                    .padding(.horizontal, __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[1].arg[1].value", fallback: 25))
                    .background(Color(.systemGray6))
                    .cornerRadius(__designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[3].arg[0].value", fallback: 8))
                    .overlay(
                        HStack {
                            Image(systemName: __designTimeString("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].arg[0].value", fallback: "magnifyingglass"))
                                .foregroundColor(.gray)
                                .frame(minWidth: __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[1].arg[0].value", fallback: 0), maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[2].arg[1].value", fallback: 8))
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    self.searchText = __designTimeString("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[1].[0].[0].arg[0].value.[0].[0]", fallback: "")
                                }) {
                                    Image(systemName: __designTimeString("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value", fallback: "multiply.circle.fill"))
                                        .foregroundColor(.gray)
                                        .padding(.trailing, __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[1].[0].[0].arg[1].value.[0].modifier[1].arg[1].value", fallback: 8))
                                }
                            }
                        }
                    )
                    .padding(.horizontal, __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[5].arg[1].value", fallback: 10))
                    .padding(.top, __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0].modifier[6].arg[1].value", fallback: 0))
            }
            
            // Custom Tabs for Teams and Players
            HStack {
                Spacer()
                VStack {
                    Text(__designTimeString("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Equipos"))
                        .fontWeight(selectedTab == __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[0].arg[0].value.if.[0]", fallback: 0) ? .regular : .light)
                        .overlay(
                            GeometryReader { geometry in
                                Rectangle()
                                    .foregroundColor(selectedTab == __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[0].arg[0].value.if.[0]", fallback: 0) ? .red : .clear)
                                    .frame(height: __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[1].arg[0].value", fallback: 2))
                                    .offset(y: geometry.size.height - __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[2].arg[0].value.[0]", fallback: 2))
                            }
                        )
                        .onTapGesture {
                            selectedTab = __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.[0].[0]", fallback: 0)
                        }
                }
                Spacer()
                VStack {
                    Text(__designTimeString("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].arg[0].value", fallback: "Jugadores"))
                        .fontWeight(selectedTab == __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[0].arg[0].value.if.[0]", fallback: 1) ? .regular : .light)
                        .overlay(
                            GeometryReader { geometry in
                                Rectangle()
                                    .foregroundColor(selectedTab == __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[0].arg[0].value.if.[0]", fallback: 1) ? .red : .clear)
                                    .frame(height: __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[1].arg[0].value", fallback: 2))
                                    .offset(y: geometry.size.height - __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0].modifier[2].arg[0].value.[0]", fallback: 2))
                            }
                        )
                        .onTapGesture {
                            selectedTab = __designTimeInteger("#6878.[1].[6].property.[0].[0].arg[1].value.[2].arg[0].value.[3].arg[0].value.[0].modifier[2].arg[0].value.[0].[0]", fallback: 1)
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
        .navigationTitle(__designTimeString("#6878.[1].[6].property.[0].[0].modifier[0].arg[0].value", fallback: "Search"))
    
#sourceLocation()
    }
}

extension SearchView {
    @_dynamicReplacement(for: filteredPlayers) private var __preview__filteredPlayers: [String] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 26)
        if searchText.isEmpty {
            return players
        } else {
            return players.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    
#sourceLocation()
    }
}

extension SearchView {
    @_dynamicReplacement(for: filteredTeams) private var __preview__filteredTeams: [String] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Search/SearchView.swift", line: 18)
        if searchText.isEmpty {
            return teams
        } else {
            return teams.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.SearchView
#Preview {
    SearchView()
}



