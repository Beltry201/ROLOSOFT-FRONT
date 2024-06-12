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
    @_dynamicReplacement(for: dateString(from:)) private func __preview__dateString(from date: Date) -> String {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/ResultCard.swift", line: 127)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: __designTimeString("#7214.[1].[2].[1].[0]", fallback: "es_ES"))
        formatter.dateFormat = __designTimeString("#7214.[1].[2].[2].[0]", fallback: "EEEE d h:mm a")
        return formatter.string(from: date).capitalized
    
#sourceLocation()
    }
}

extension ResultCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Components/ResultCard.swift", line: 14)
        VStack {
            Text(dateString(from: match.dateTimeStart))
                .foregroundColor(.gray)
                .font(.caption)
            
            HStack {
                VStack {
                    if let imageUrl = URL(string: match.teamA.fullTeamPictureUrl) {
                        AsyncImage(url: imageUrl) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].modifier[0].arg[1].value", fallback: 60))
                        .cornerRadius(__designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[0].[0].modifier[1].arg[0].value", fallback: 8))
                        .clipped()
                    } else {
                        Color.gray
                            .frame(width: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].modifier[0].arg[1].value", fallback: 60))
                            .cornerRadius(__designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[0].[1].[0].modifier[1].arg[0].value", fallback: 8))
                    }
                    Text(match.teamA.name)
                        .frame(maxWidth: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 70))
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .fixedSize(horizontal: __designTimeBoolean("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[0].value", fallback: false), vertical: __designTimeBoolean("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[1].value", fallback: true))
                    
                    if !match.teamA.goals.isEmpty {
                        VStack(spacing: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[2].[0].[0].arg[0].value", fallback: 4)) {
                            ForEach(match.teamA.goals) { goal in
                                Text("\(goal.name) \(goal.lastName) - \(goal.minute)'")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                Spacer()
                if Date() < match.dateTimeStart {
                    Text(__designTimeString("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[2].[0].[0].arg[0].value", fallback: "-"))
                        .font(.title)
                    Spacer()
                    Text(__designTimeString("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[2].[0].[2].arg[0].value", fallback: "-"))
                        .font(.title)
                    Spacer()
                    Text(__designTimeString("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[2].[0].[4].arg[0].value", fallback: "-"))
                        .font(.title)
                } else if Date() > match.dateTimeEnd {
                    Text("\(match.teamA.goals.count)")
                        .font(.title)
                    Spacer()
                    Text(__designTimeString("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[2].[1].[2].arg[0].value", fallback: "-"))
                        .font(.title)
                    Spacer()
                    Text("\(match.teamB.goals.count)")
                        .font(.title)
                } else {
                    Text(__designTimeString("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[2].[2].[0].arg[0].value", fallback: "-"))
                        .font(.title)
                    Spacer()
                    Text(__designTimeString("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[2].[2].[2].arg[0].value", fallback: "-"))
                        .font(.title)
                    Spacer()
                    Text(__designTimeString("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[2].[2].[4].arg[0].value", fallback: "-"))
                        .font(.title)
                }
                Spacer()
                VStack {
                    if let imageUrl = URL(string: match.teamB.fullTeamPictureUrl) {
                        AsyncImage(url: imageUrl) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[0].[0].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[0].[0].[0].modifier[0].arg[1].value", fallback: 60))
                        .cornerRadius(__designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[0].[0].[0].modifier[1].arg[0].value", fallback: 8))
                        .clipped()
                    } else {
                        Color.gray
                            .frame(width: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[0].[1].[0].modifier[0].arg[0].value", fallback: 60), height: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[0].[1].[0].modifier[0].arg[1].value", fallback: 60))
                            .cornerRadius(__designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[0].[1].[0].modifier[1].arg[0].value", fallback: 8))
                    }
                    Text(match.teamB.name)
                        .frame(maxWidth: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[1].modifier[0].arg[0].value", fallback: 70))
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .fixedSize(horizontal: __designTimeBoolean("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[1].modifier[4].arg[0].value", fallback: false), vertical: __designTimeBoolean("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[1].modifier[4].arg[1].value", fallback: true))
                    
                    if !match.teamB.goals.isEmpty {
                        VStack(spacing: __designTimeInteger("#7214.[1].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[4].arg[0].value.[2].[0].[0].arg[0].value", fallback: 4)) {
                            ForEach(match.teamB.goals) { goal in
                                Text("\(goal.name) \(goal.lastName) - \(goal.minute)'")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
        }
        .padding(__designTimeInteger("#7214.[1].[1].property.[0].[0].modifier[0].arg[0].value", fallback: 20))
        .background(Color.white)
        .cornerRadius(__designTimeInteger("#7214.[1].[1].property.[0].[0].modifier[2].arg[0].value", fallback: 10))
        .shadow(color: Color.black.opacity(__designTimeFloat("#7214.[1].[1].property.[0].[0].modifier[3].arg[0].value.modifier[0].arg[0].value", fallback: 0.1)), radius: __designTimeInteger("#7214.[1].[1].property.[0].[0].modifier[3].arg[1].value", fallback: 5), x: __designTimeInteger("#7214.[1].[1].property.[0].[0].modifier[3].arg[2].value", fallback: 0), y: __designTimeInteger("#7214.[1].[1].property.[0].[0].modifier[3].arg[3].value", fallback: 2))
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.ResultCard
#Preview {
    ResultCard(
        match: MatchEvent(
            id: "1",
            dateTimeStart: Date().addingTimeInterval(-3600),
            dateTimeEnd: Date().addingTimeInterval(-1800),
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
        )
    )
}



