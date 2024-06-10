//
//  TeamDetailView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 27/05/24.
//

import SwiftUI

struct TeamDetailView: View {
    let teamDetails: TeamDetails?
    @State private var selectedTab = 0
    @State private var matches: [MatchEvent] = []

    var body: some View {
        if let teamDetails = teamDetails {
            VStack {
                TeamDetailHead(teamDetails: teamDetails).padding(.horizontal, 20)
                    
                HStack {
                    Spacer()
                    TeamTabBarButton(title: "Matches", isSelected: selectedTab == 0) {
                        selectedTab = 0
                    }
                    .padding(.horizontal, 16)
                    Spacer()
                    TeamTabBarButton(title: "Players", isSelected: selectedTab == 1) {
                        selectedTab = 1
                    }
                    .padding(.horizontal, 16)
                    Spacer()
                    TeamTabBarButton(title: "Photos", isSelected: selectedTab == 2) {
                        selectedTab = 2
                    }
                    .padding(.horizontal, 16)
                    Spacer()
                }
                .padding(.top, 8)

                TabView(selection: $selectedTab) {
                    // Tab 1: Matches
                    MatchesList(matches: matches)
                        .tag(0)

                    // Tab 2: Players
                    VStack {
                        Text("Players content goes here")
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .tag(1)

                    // Tab 3: Photos
                    VStack {
                        Text("Photos content goes here")
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.top, -8)
            }
            .onAppear {
                fetchMatches()
            }
        } else {
            Text("No team details available")
        }
    }
    
    private func fetchMatches() {
        guard let tournamentId = UserDefaults.standard.string(forKey: "tournamentId"),
              let token = UserDefaults.standard.string(forKey: "token"),
              let teamId = teamDetails?.schoolId else {
            print("Tournament ID, token, or team ID not found in UserDefaults")
            return
        }
        
        APIService().fetchTeamMatches(tournamentId: tournamentId, teamId: teamId, token: token) { result in
            switch result {
            case .success(let fetchedMatches):
                matches = fetchedMatches
            case .failure(let error):
                print("Error fetching matches: \(error)")
            }
        }
    }
}

    
struct MatchesList: View {
    var matches: [MatchEvent]

    var body: some View {
        List(matches) { match in
            ResultCard(match: match)
                .listRowInsets(.init(
                    top: 0,
                    leading: 0,
                    bottom: 8,
                    trailing: 0)
                )
                .background(.clear)
        }
    }
}


struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTeamDetails = TeamDetails(
            tournamentId: "1",
            schoolId: "1",
            schoolName: "Sample Team",
            defeats: 2,
            draws: 3,
            victories: 5,
            goalsFor: 15,
            goalsAgainst: 10,
            goalDifference: 5,
            gamesPlayed: 10,
            points: 18,
            position: 2,
            shieldFileName: "sample_team.png"
        )
        TeamDetailView(teamDetails: sampleTeamDetails)
    }
    
    static var dummyMatchEvents: [MatchEvent] {
        let teamA = MatchEvent.Team(
            id: "e470f269-237c-4a2b-ba17-cdf74af01e64",
            name: "América",
            points: 3,
            shieldImg: "escudo-america.png",
            goals: [
                MatchEvent.Team.Goal(id: "1", name: "David", lastName: "Beltran", minute: 10, playerNumber: 10),
                MatchEvent.Team.Goal(id: "2", name: "David", lastName: "Beltran", minute: 20, playerNumber: 10)
            ]
        )
        let teamB = MatchEvent.Team(
            id: "48b576c2-38ff-4828-8061-254b2bf8d883",
            name: "Santa Fe",
            points: 1,
            shieldImg: "escudo-santa-fe.png",
            goals: [
                MatchEvent.Team.Goal(id: "3", name: "Juan", lastName: "Bedoya", minute: 15, playerNumber: 7)
            ]
        )
        
        let match1 = MatchEvent(
            id: "d5203e5e-6635-44ef-a81c-626111212c5e",
            dateTimeStart: Date(),
            dateTimeEnd: Date(),
            isPlaying: false,
            teamA: teamA,
            teamB: teamB
        )
        let match2 = MatchEvent(
            id: "6386fb56-e79e-419d-b524-d8fb9a864f2f",
            dateTimeStart: Date(),
            dateTimeEnd: Date(),
            isPlaying: false,
            teamA: teamB,
            teamB: teamA
        )
        
        return [match1, match2]
    }
}


struct TeamTabBarButton: View {
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

