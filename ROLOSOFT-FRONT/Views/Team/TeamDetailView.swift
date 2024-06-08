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

    var body: some View {
        if let teamDetails = teamDetails {
            VStack {
                TeamDetailHead(teamDetails: teamDetails)
                    .padding(.top, 8) // Adjust top padding to align with navigation bar

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
                    VStack {
                        ForEach(TeamDetailView_Previews.dummyPlayedMatchResults) { match in
                            ResultCard(data: match)
                                .padding(.vertical, 4)
                        }
                    }
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
                .padding(.top, -8) // Adjust negative top padding to align content properly
            }
        } else {
            Text("No team details available")
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
    
    static var dummyPlayedMatchResults: [PlayedMatchResult] {
           let teamA = TeamDetailData(id: "e470f269-237c-4a2b-ba17-cdf74af01e64", name: "América", shieldFileName: "escudo-america.png", goals: [])
           let teamB = TeamDetailData(id: "48b576c2-38ff-4828-8061-254b2bf8d883", name: "Santa Fe", shieldFileName: "escudo-santa-fe.png", goals: [])
           
           let goalA1 = GoalData(id: "741d8594-9dc0-4e2f-8ced-ee6c8f5ed5eb", name: "David", lastName: "Beltran", minute: 10, playerNumber: 10)
           let goalA2 = GoalData(id: "741d8594-9dc0-4e2f-8ced-ee6c8f5ed5eb", name: "David", lastName: "Beltran", minute: 20, playerNumber: 10)
           let goalB1 = GoalData(id: "741d8594-9dc0-4e2f-8ced-ee6c8f5ed5eb", name: "David", lastName: "Beltran", minute: 15, playerNumber: 7)
           
           var match1 = PlayedMatchResult(id: "d5203e5e-6635-44ef-a81c-626111212c5e", dateTimeStart: Date(), dateTimeEnd: Date(), teamA: teamA, teamB: teamB)
           var match2 = PlayedMatchResult(id: "6386fb56-e79e-419d-b524-d8fb9a864f2f", dateTimeStart: Date(), dateTimeEnd: Date(), teamA: teamB, teamB: teamA)
           
           match1.teamB.goals = [goalA1, goalA2]
           match2.teamA.goals = [goalB1]
           
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
