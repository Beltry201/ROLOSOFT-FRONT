//
//  DetailTeamResultListItem.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 16/05/24.
//

import SwiftUI

struct ResultCard: View {
    var match: MatchEvent
    
    var body: some View {
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
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                        .clipped()
                    } else {
                        Color.gray
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                    }
                    Text(match.teamA.name)
                        .frame(maxWidth: 70)
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    if !match.teamA.goals.isEmpty {
                        VStack(spacing: 4) {
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
                    Text("-")
                        .font(.title)
                    Spacer()
                    Text("-")
                        .font(.title)
                    Spacer()
                    Text("-")
                        .font(.title)
                } else if Date() > match.dateTimeEnd {
                    Text("\(match.teamA.goals.count)")
                        .font(.title)
                    Spacer()
                    Text("-")
                        .font(.title)
                    Spacer()
                    Text("\(match.teamB.goals.count)")
                        .font(.title)
                } else {
                    Text("-")
                        .font(.title)
                    Spacer()
                    Text("-")
                        .font(.title)
                    Spacer()
                    Text("-")
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
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                        .clipped()
                    } else {
                        Color.gray
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                    }
                    Text(match.teamB.name)
                        .frame(maxWidth: 70)
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    if !match.teamB.goals.isEmpty {
                        VStack(spacing: 4) {
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
        .padding(20)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    private func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        formatter.dateFormat = "EEEE d h:mm a"
        return formatter.string(from: date).capitalized
    }
}

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
