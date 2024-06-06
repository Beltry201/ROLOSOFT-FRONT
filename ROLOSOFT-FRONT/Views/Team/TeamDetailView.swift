//
//  TeamDetailView.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 27/05/24.
//

import SwiftUI

struct TeamDetailView: View {
    let teamDetails: TeamDetails?

    var body: some View {
        if let teamDetails = teamDetails {
            TeamDetailHead(
                logoUrl: teamDetails.fullTeamPictureUrl,
                position: teamDetails.position,
                name: teamDetails.schoolName,
                df: teamDetails.goalDifference,
                jj: teamDetails.gamesPlayed,
                jg: teamDetails.victories,
                pt: teamDetails.points,
                je: teamDetails.draws,
                jp: teamDetails.defeats,
                gf: teamDetails.goalsFor,
                gc: teamDetails.goalsAgainst
            )
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
