@_private(sourceFile: "TeamDetailView.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension TeamTabBarButton {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 122)
        VStack {
            Text(title)
                .fontWeight(isSelected ? .regular : .light)
                .foregroundColor(isSelected ? .black : .gray)
            Rectangle()
                .foregroundColor(isSelected ? .red : .clear)
                .frame(height: __designTimeInteger("#10113.[3].[3].property.[0].[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 2))
                .padding(.top, __designTimeInteger("#10113.[3].[3].property.[0].[0].arg[0].value.[1].modifier[2].arg[1].value", fallback: 4))
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    
#sourceLocation()
    }
}

extension TeamDetailView_Previews {
    @_dynamicReplacement(for: dummyPlayedMatchResults) private static var __preview__dummyPlayedMatchResults: [PlayedMatchResult] {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 98)
           let teamA = TeamDetailData(id: __designTimeString("#10113.[2].[1].property.[0].[0].value.arg[0].value", fallback: "e470f269-237c-4a2b-ba17-cdf74af01e64"), name: __designTimeString("#10113.[2].[1].property.[0].[0].value.arg[1].value", fallback: "América"), shieldFileName: __designTimeString("#10113.[2].[1].property.[0].[0].value.arg[2].value", fallback: "escudo-america.png"), goals: [])
           let teamB = TeamDetailData(id: __designTimeString("#10113.[2].[1].property.[0].[1].value.arg[0].value", fallback: "48b576c2-38ff-4828-8061-254b2bf8d883"), name: __designTimeString("#10113.[2].[1].property.[0].[1].value.arg[1].value", fallback: "Santa Fe"), shieldFileName: __designTimeString("#10113.[2].[1].property.[0].[1].value.arg[2].value", fallback: "escudo-santa-fe.png"), goals: [])
           
           let goalA1 = GoalData(id: __designTimeString("#10113.[2].[1].property.[0].[2].value.arg[0].value", fallback: "741d8594-9dc0-4e2f-8ced-ee6c8f5ed5eb"), name: __designTimeString("#10113.[2].[1].property.[0].[2].value.arg[1].value", fallback: "David"), lastName: __designTimeString("#10113.[2].[1].property.[0].[2].value.arg[2].value", fallback: "Beltran"), minute: __designTimeInteger("#10113.[2].[1].property.[0].[2].value.arg[3].value", fallback: 10), playerNumber: __designTimeInteger("#10113.[2].[1].property.[0].[2].value.arg[4].value", fallback: 10))
           let goalA2 = GoalData(id: __designTimeString("#10113.[2].[1].property.[0].[3].value.arg[0].value", fallback: "741d8594-9dc0-4e2f-8ced-ee6c8f5ed5eb"), name: __designTimeString("#10113.[2].[1].property.[0].[3].value.arg[1].value", fallback: "David"), lastName: __designTimeString("#10113.[2].[1].property.[0].[3].value.arg[2].value", fallback: "Beltran"), minute: __designTimeInteger("#10113.[2].[1].property.[0].[3].value.arg[3].value", fallback: 20), playerNumber: __designTimeInteger("#10113.[2].[1].property.[0].[3].value.arg[4].value", fallback: 10))
           let goalB1 = GoalData(id: __designTimeString("#10113.[2].[1].property.[0].[4].value.arg[0].value", fallback: "741d8594-9dc0-4e2f-8ced-ee6c8f5ed5eb"), name: __designTimeString("#10113.[2].[1].property.[0].[4].value.arg[1].value", fallback: "David"), lastName: __designTimeString("#10113.[2].[1].property.[0].[4].value.arg[2].value", fallback: "Beltran"), minute: __designTimeInteger("#10113.[2].[1].property.[0].[4].value.arg[3].value", fallback: 15), playerNumber: __designTimeInteger("#10113.[2].[1].property.[0].[4].value.arg[4].value", fallback: 7))
           
           var match1 = PlayedMatchResult(id: __designTimeString("#10113.[2].[1].property.[0].[5].value.arg[0].value", fallback: "d5203e5e-6635-44ef-a81c-626111212c5e"), dateTimeStart: Date(), dateTimeEnd: Date(), teamA: teamA, teamB: teamB)
           var match2 = PlayedMatchResult(id: __designTimeString("#10113.[2].[1].property.[0].[6].value.arg[0].value", fallback: "6386fb56-e79e-419d-b524-d8fb9a864f2f"), dateTimeStart: Date(), dateTimeEnd: Date(), teamA: teamB, teamB: teamA)
           
           match1.teamB.goals = [goalA1, goalA2]
           match2.teamA.goals = [goalB1]
           
           return [match1, match2]
       
#sourceLocation()
    }
}

extension TeamDetailView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 79)
        let sampleTeamDetails = TeamDetails(
            tournamentId: __designTimeString("#10113.[2].[0].property.[0].[0].value.arg[0].value", fallback: "1"),
            schoolId: __designTimeString("#10113.[2].[0].property.[0].[0].value.arg[1].value", fallback: "1"),
            schoolName: __designTimeString("#10113.[2].[0].property.[0].[0].value.arg[2].value", fallback: "Sample Team"),
            defeats: __designTimeInteger("#10113.[2].[0].property.[0].[0].value.arg[3].value", fallback: 2),
            draws: __designTimeInteger("#10113.[2].[0].property.[0].[0].value.arg[4].value", fallback: 3),
            victories: __designTimeInteger("#10113.[2].[0].property.[0].[0].value.arg[5].value", fallback: 5),
            goalsFor: __designTimeInteger("#10113.[2].[0].property.[0].[0].value.arg[6].value", fallback: 15),
            goalsAgainst: __designTimeInteger("#10113.[2].[0].property.[0].[0].value.arg[7].value", fallback: 10),
            goalDifference: __designTimeInteger("#10113.[2].[0].property.[0].[0].value.arg[8].value", fallback: 5),
            gamesPlayed: __designTimeInteger("#10113.[2].[0].property.[0].[0].value.arg[9].value", fallback: 10),
            points: __designTimeInteger("#10113.[2].[0].property.[0].[0].value.arg[10].value", fallback: 18),
            position: __designTimeInteger("#10113.[2].[0].property.[0].[0].value.arg[11].value", fallback: 2),
            shieldFileName: __designTimeString("#10113.[2].[0].property.[0].[0].value.arg[12].value", fallback: "sample_team.png")
        )
        TeamDetailView(teamDetails: sampleTeamDetails)
    
#sourceLocation()
    }
}

extension TeamDetailView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Views/Team/TeamDetailView.swift", line: 15)
        if let teamDetails = teamDetails {
            VStack {
                TeamDetailHead(teamDetails: teamDetails)
                    .padding(.top, __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 8)) // Adjust top padding to align with navigation bar

                HStack {
                    Spacer()
                    TeamTabBarButton(title: __designTimeString("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value", fallback: "Matches"), isSelected: selectedTab == __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0]", fallback: 0)) {
                        selectedTab = __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[1].arg[2].value.[0].[0]", fallback: 0)
                    }
                    .padding(.horizontal, __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[1].modifier[0].arg[1].value", fallback: 16))
                    Spacer()
                    TeamTabBarButton(title: __designTimeString("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[3].arg[0].value", fallback: "Players"), isSelected: selectedTab == __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[3].arg[1].value.[0]", fallback: 1)) {
                        selectedTab = __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[3].arg[2].value.[0].[0]", fallback: 1)
                    }
                    .padding(.horizontal, __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[3].modifier[0].arg[1].value", fallback: 16))
                    Spacer()
                    TeamTabBarButton(title: __designTimeString("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[5].arg[0].value", fallback: "Photos"), isSelected: selectedTab == __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[5].arg[1].value.[0]", fallback: 2)) {
                        selectedTab = __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[5].arg[2].value.[0].[0]", fallback: 2)
                    }
                    .padding(.horizontal, __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].arg[0].value.[5].modifier[0].arg[1].value", fallback: 16))
                    Spacer()
                }
                .padding(.top, __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 8))

                TabView(selection: $selectedTab) {
                    // Tab 1: Matches
                    VStack {
                        ForEach(TeamDetailView_Previews.dummyPlayedMatchResults) { match in
                            ResultCard(data: match)
                                .padding(.vertical, __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[2].arg[1].value.[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: 4))
                        }
                    }
                    .tag(__designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[2].arg[1].value.[0].modifier[0].arg[0].value", fallback: 0))

                    // Tab 2: Players
                    VStack {
                        Text(__designTimeString("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[2].arg[1].value.[1].arg[0].value.[0].arg[0].value", fallback: "Players content goes here"))
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .tag(__designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[2].arg[1].value.[1].modifier[0].arg[0].value", fallback: 1))

                    // Tab 3: Photos
                    VStack {
                        Text(__designTimeString("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[2].arg[1].value.[2].arg[0].value.[0].arg[0].value", fallback: "Photos content goes here"))
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .tag(__designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[2].arg[1].value.[2].modifier[0].arg[0].value", fallback: 2))
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.top, __designTimeInteger("#10113.[1].[2].property.[0].[0].[0].[0].arg[0].value.[2].modifier[1].arg[1].value", fallback: -8)) // Adjust negative top padding to align content properly
            }
        } else {
            Text(__designTimeString("#10113.[1].[2].property.[0].[0].[1].[0].arg[0].value", fallback: "No team details available"))
        }
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.TeamDetailView
import struct ROLOSOFT_FRONT.TeamDetailView_Previews
import struct ROLOSOFT_FRONT.TeamTabBarButton

