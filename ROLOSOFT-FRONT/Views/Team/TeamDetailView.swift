//
//  TeamDetailView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 27/05/24.
//

import SwiftUI

struct TeamDetailView: View {
    let teamId: String
    @State private var teamDetails: TeamDetails?
    @State private var selectedTab = 0
    @State private var matches: [MatchEvent] = []

    var body: some View {
        VStack {
            if let teamDetails = teamDetails {
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
                        ScrollView {
                            GridPlayers(players: [
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil),
                                GridPlayer(name: "Jugador 1", shirtNumber: 10, imgUrl: nil)
                            ])
                        }
                    }
                    .tag(1)

                    // Tab 3: Photos
                    VStack {
                        ScrollView {
                            GridPhotos(photos: [
                                GridPhoto(url: nil),
                                GridPhoto(url: nil),
                                GridPhoto(url: nil),
                                GridPhoto(url: nil),
                                GridPhoto(url: nil),
                                GridPhoto(url: nil),
                                GridPhoto(url: nil),
                                GridPhoto(url: nil),
                                GridPhoto(url: nil),
                                GridPhoto(url: nil),
                                GridPhoto(url: nil)
                            ])
                        }
                    }
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.top, -8)
            } else {
                Text("Loading team details...")
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
    }
    
    private func fetchTeamDetails() {
        guard let tournamentId = UserDefaults.standard.string(forKey: "tournamentId"),
              let token = UserDefaults.standard.string(forKey: "jwtToken") else {
            print("Tournament ID or token not found in UserDefaults")
            return
        }
        
        self.teamDetails = TeamDetails(
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
        
        return
        
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
    }

    private func fetchMatches() {
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

// Sample Data Preview
struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailPreviewWrapper()
    }
}

struct TeamDetailPreviewWrapper: View {
    @State private var teamDetails: TeamDetails? = TeamDetails(
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
    @State private var matches: [MatchEvent] = [
        MatchEvent(
            id: "1",
            dateTimeStart: Date(),
            dateTimeEnd: Date(),
            isPlaying: false,
            teamA: MatchEvent.Team(
                id: "1",
                name: "Team A",
                points: 3,
                shieldFileName: "teamA.png",
                goals: [
                    MatchEvent.Team.Goal(id: "1", name: "David", lastName: "Beltran", minute: 10, playerNumber: 10),
                    MatchEvent.Team.Goal(id: "2", name: "David", lastName: "Beltran", minute: 20, playerNumber: 10)
                ]
            ),
            teamB: MatchEvent.Team(
                id: "2",
                name: "Team B",
                points: 1,
                shieldFileName: "teamB.png",
                goals: [
                    MatchEvent.Team.Goal(id: "3", name: "Juan", lastName: "Bedoya", minute: 15, playerNumber: 7)
                ]
            )
        ),
        MatchEvent(
            id: "2",
            dateTimeStart: Date(),
            dateTimeEnd: Date(),
            isPlaying: false,
            teamA: MatchEvent.Team(
                id: "2",
                name: "Team B",
                points: 1,
                shieldFileName: "teamB.png",
                goals: [
                    MatchEvent.Team.Goal(id: "3", name: "Juan", lastName: "Bedoya", minute: 15, playerNumber: 7)
                ]
            ),
            teamB: MatchEvent.Team(
                id: "1",
                name: "Team A",
                points: 3,
                shieldFileName: "teamA.png",
                goals: [
                    MatchEvent.Team.Goal(id: "1", name: "David", lastName: "Beltran", minute: 10, playerNumber: 10),
                    MatchEvent.Team.Goal(id: "2", name: "David", lastName: "Beltran", minute: 20, playerNumber: 10)
                ]
            )
        )
    ]

    var body: some View {
        TeamDetailView(teamId: "1")
            .environmentObject(PreviewDataProvider(teamDetails: $teamDetails, matches: $matches))
    }
}

class PreviewDataProvider: ObservableObject {
    @Binding var teamDetails: TeamDetails?
    @Binding var matches: [MatchEvent]

    init(teamDetails: Binding<TeamDetails?>, matches: Binding<[MatchEvent]>) {
        _teamDetails = teamDetails
        _matches = matches
    }
}
