@_private(sourceFile: "ResultCard.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ResultCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/ResultCard.swift", line: 14)
        VStack {
            Text(data.dateString)
                .foregroundColor(.gray)
                .font(.caption)
            
            HStack {
                VStack {
                    if let imageUrl = URL(string: data.teamA.fullTeamPictureUrl) {
                        AsyncImage(url: imageUrl) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].modifier[0].arg[1].value", fallback: 60))
                        .cornerRadius(__designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value", fallback: 8))
                        .clipped()
                    } else {
                        Color.gray
                            .frame(width: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].modifier[0].arg[1].value", fallback: 60))
                            .cornerRadius(__designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].modifier[1].arg[0].value", fallback: 8))
                    }
                    Text(data.teamA.name)
                        .frame(maxWidth: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 70))
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .fixedSize(horizontal: __designTimeBoolean("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[0].value", fallback: false), vertical: __designTimeBoolean("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[1].value", fallback: true))
                    
                    if !data.teamA.goals.isEmpty {
                        VStack(spacing: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[2].[0].[0].arg[0].value", fallback: 4)) {
                            ForEach(data.teamA.goals) { goal in
                                Text("\(goal.name) \(goal.lastName) - \(goal.minute)'")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                Spacer()
                Text("\(data.teamA.goals.count)")
                    .font(.title)
                Spacer()
                Text(__designTimeString("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value", fallback: "-"))
                    .font(.title)
                Spacer()
                Text("\(data.teamB.goals.count)")
                    .font(.title)
                Spacer()
                VStack {
                    if let imageUrl = URL(string: data.teamB.fullTeamPictureUrl) {
                        AsyncImage(url: imageUrl) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[0].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[0].[0].modifier[0].arg[1].value", fallback: 60))
                        .cornerRadius(__designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[0].[0].modifier[1].arg[0].value", fallback: 8))
                        .clipped()
                    } else {
                        Color.gray
                            .frame(width: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[1].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[1].[0].modifier[0].arg[1].value", fallback: 60))
                            .cornerRadius(__designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[0].[1].[0].modifier[1].arg[0].value", fallback: 8))
                    }
                    Text(data.teamB.name)
                        .frame(maxWidth: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[1].modifier[0].arg[0].value", fallback: 70))
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .fixedSize(horizontal: __designTimeBoolean("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[1].modifier[4].arg[0].value", fallback: false), vertical: __designTimeBoolean("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[1].modifier[4].arg[1].value", fallback: true))
                    
                    if !data.teamB.goals.isEmpty {
                        VStack(spacing: __designTimeInteger("#8831.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[8].arg[0].value.[2].[0].[0].arg[0].value", fallback: 4)) {
                            ForEach(data.teamB.goals) { goal in
                                Text("\(goal.name) \(goal.lastName) - \(goal.minute)'")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
        }
        .padding(__designTimeInteger("#8831.[1].[1].property.[0].[0].modifier[0].arg[0].value", fallback: 20))
        .background(Color.white)
        .cornerRadius(__designTimeInteger("#8831.[1].[1].property.[0].[0].modifier[2].arg[0].value", fallback: 10))
        .shadow(color: Color.black.opacity(__designTimeFloat("#8831.[1].[1].property.[0].[0].modifier[3].arg[0].value.modifier[0].arg[0].value", fallback: 0.1)), radius: __designTimeInteger("#8831.[1].[1].property.[0].[0].modifier[3].arg[1].value", fallback: 5), x: __designTimeInteger("#8831.[1].[1].property.[0].[0].modifier[3].arg[2].value", fallback: 0), y: __designTimeInteger("#8831.[1].[1].property.[0].[0].modifier[3].arg[3].value", fallback: 2))
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ResultCard
#Preview {
    ResultCard(
        data: PlayedMatchResult(
            id: "1",
            dateTimeStart: Date(),
            dateTimeEnd: Date(),
            teamA: TeamDetailData(
                id: "1",
                name: "Team A",
                shieldFileName: "teamA.png",
                goals: [
                    GoalData(id: "1", name: "David", lastName: "Beltran", minute: 10, playerNumber: 10),
                    GoalData(id: "2", name: "David", lastName: "Beltran", minute: 20, playerNumber: 10)
                ]
            ),
            teamB: TeamDetailData(
                id: "2",
                name: "Team B",
                shieldFileName: "teamB.png",
                goals: [
                    GoalData(id: "3", name: "Juan", lastName: "Bedoya", minute: 15, playerNumber: 7)
                ]
            )
        )
    )
}



