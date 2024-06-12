@_private(sourceFile: "TeamDetailView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension TeamDetailPreviewWrapper {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 235)
        TeamDetailView(teamId: __designTimeString("#6895.[5].[2].property.[0].[0].arg[0].value", fallback: "1"))
            .environmentObject(PreviewDataProvider(teamDetails: $teamDetails, matches: $matches))
    
#sourceLocation()
    }
}

extension TeamDetailView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 161)
        TeamDetailPreviewWrapper()
    
#sourceLocation()
    }
}

extension TeamTabBarButton {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 142)
        VStack {
            Text(title)
                .fontWeight(isSelected ? .regular : .light)
                .foregroundColor(isSelected ? .black : .gray)
            Rectangle()
                .foregroundColor(isSelected ? .red : .clear)
                .frame(height: __designTimeInteger("#6895.[3].[3].property.[0].[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 2))
                .padding(.top, __designTimeInteger("#6895.[3].[3].property.[0].[0].arg[0].value.[1].modifier[2].arg[1].value", fallback: 4))
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    
#sourceLocation()
    }
}

extension MatchesList {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 122)
        List(matches) { match in
            ResultCard(match: match)
                .listRowInsets(.init(
                    top: __designTimeInteger("#6895.[2].[1].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 0),
                    leading: __designTimeInteger("#6895.[2].[1].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 0),
                    bottom: __designTimeInteger("#6895.[2].[1].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value.arg[2].value", fallback: 8),
                    trailing: __designTimeInteger("#6895.[2].[1].property.[0].[0].arg[1].value.[0].modifier[0].arg[0].value.arg[3].value", fallback: 0))
                )
                .background(.clear)
        }
    
#sourceLocation()
    }
}

extension TeamDetailView {
    @_dynamicReplacement(for: fetchMatches()) private func __preview__fetchMatches() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 100)
        guard let tournamentId = UserDefaults.standard.string(forKey: "tournamentId"),
              let token = UserDefaults.standard.string(forKey: "jwtToken"),
              let teamId = teamDetails?.schoolId else {
            print("Tournament ID, token, or team ID not found in UserDefaults")
            return
        }
        
        APIService().fetchTeamMatches(tournamentId: tournamentId, teamId: teamId, token: token) { result in
            switch result {
            case .success(let fetchedMatches):
                matches = fetchedMatches.sorted(by: { $0.dateTimeStart < $1.dateTimeStart })
            case .failure(let error):
                print("Error fetching matches: \(error)")
            }
        }
    
#sourceLocation()
    }
}

extension TeamDetailView {
    @_dynamicReplacement(for: fetchTeamDetails()) private func __preview__fetchTeamDetails() {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 81)
        guard let tournamentId = UserDefaults.standard.string(forKey: "tournamentId"),
              let token = UserDefaults.standard.string(forKey: "jwtToken") else {
            print("Tournament ID or token not found in UserDefaults")
            return
        }
        
        APIService().fetchTeamDetails(tournamentId: tournamentId, teamId: teamId, token: token) { result in
            switch result {
            case .success(let teamDetails):
                print("Fetched Team Details: \(teamDetails)")
                self.teamDetails = teamDetails
                fetchMatches()
            case .failure(let error):
                print("Error fetching team details: \(error)")
            }
        }
    
#sourceLocation()
    }
}

extension TeamDetailView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 17)
        VStack {
            if let teamDetails = teamDetails {
                TeamDetailHead(teamDetails: teamDetails).padding(.horizontal, __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[0].modifier[0].arg[1].value", fallback: 20))
                    
                HStack {
                    Spacer()
                    TeamTabBarButton(title: __designTimeString("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[1].arg[0].value", fallback: "Matches"), isSelected: selectedTab == __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[1].arg[1].value.[0]", fallback: 0)) {
                        selectedTab = __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[1].arg[2].value.[0].[0]", fallback: 0)
                    }
                    .padding(.horizontal, __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[1].modifier[0].arg[1].value", fallback: 16))
                    Spacer()
                    TeamTabBarButton(title: __designTimeString("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[3].arg[0].value", fallback: "Players"), isSelected: selectedTab == __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[3].arg[1].value.[0]", fallback: 1)) {
                        selectedTab = __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[3].arg[2].value.[0].[0]", fallback: 1)
                    }
                    .padding(.horizontal, __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[3].modifier[0].arg[1].value", fallback: 16))
                    Spacer()
                    TeamTabBarButton(title: __designTimeString("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[5].arg[0].value", fallback: "Photos"), isSelected: selectedTab == __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[5].arg[1].value.[0]", fallback: 2)) {
                        selectedTab = __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[5].arg[2].value.[0].[0]", fallback: 2)
                    }
                    .padding(.horizontal, __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.[5].modifier[0].arg[1].value", fallback: 16))
                    Spacer()
                }
                .padding(.top, __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[1].modifier[0].arg[1].value", fallback: 8))

                TabView(selection: $selectedTab) {
                    // Tab 1: Matches
                    MatchesList(matches: matches)
                        .tag(__designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[0].modifier[0].arg[0].value", fallback: 0))

                    // Tab 2: Players
                    VStack {
                        Text(__designTimeString("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[1].arg[0].value.[0].arg[0].value", fallback: "Players content goes here"))
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .tag(__designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[1].modifier[0].arg[0].value", fallback: 1))

                    // Tab 3: Photos
                    VStack {
                        Text(__designTimeString("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[2].arg[0].value.[0].arg[0].value", fallback: "Photos content goes here"))
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .tag(__designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[2].arg[1].value.[2].modifier[0].arg[0].value", fallback: 2))
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.top, __designTimeInteger("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[0].[2].modifier[1].arg[1].value", fallback: -8))
            } else {
                Text(__designTimeString("#6895.[1].[4].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value", fallback: "Loading team details..."))
                    .onAppear {
                        fetchTeamDetails()
                    }
            }
        }
        .onAppear {
            if teamDetails != nil {
                fetchMatches()
            }
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.TeamDetailView
import struct ROLOSOFT_FRONT.MatchesList
import struct ROLOSOFT_FRONT.TeamTabBarButton
import struct ROLOSOFT_FRONT.TeamDetailView_Previews
import struct ROLOSOFT_FRONT.TeamDetailPreviewWrapper
import class ROLOSOFT_FRONT.PreviewDataProvider

