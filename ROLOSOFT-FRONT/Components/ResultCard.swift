//
//  DetailTeamResultListItem.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 16/05/24.
//

import SwiftUI

struct ResultCard: View {
    var data: PlayedMatchResult
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text(data.dateString)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
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
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                            .clipped()
                        } else {
                            Color.gray
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                        }
                        Text(data.teamA.name)
                            .frame(maxWidth: 70)
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        // Display goals for team A
                        if !data.teamA.goals.isEmpty {
                            VStack(spacing: 4) {
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
                    Text("-")
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
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                            .clipped()
                        } else {
                            Color.gray
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                        }
                        Text(data.teamB.name)
                            .frame(maxWidth: 70)
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        // Display goals for team B
                        if !data.teamB.goals.isEmpty {
                            VStack(spacing: 4) {
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
            .padding(20)
            .frame(width: geometry.size.width)
            .background(.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

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
