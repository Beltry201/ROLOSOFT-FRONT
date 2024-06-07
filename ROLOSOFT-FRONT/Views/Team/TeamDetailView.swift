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
                        Text("Matches content goes here")
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
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
