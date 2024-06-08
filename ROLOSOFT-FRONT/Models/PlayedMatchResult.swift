//
//  PlayedMatchResult.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 7/06/24.
//

import Foundation

struct PlayedMatchResult: Identifiable {
    var id: String
    var dateTimeStart: Date
    var dateTimeEnd: Date
    var teamA: TeamDetailData
    var teamB: TeamDetailData
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd - hh:mm a"
        return formatter.string(from: dateTimeStart)
    }
}

struct TeamDetailData {
    var id: String
    var name: String
    var shieldFileName: String
    var goals: [GoalData]
    
    var fullTeamPictureUrl: String {
        return baseUrl + shieldFileName
    }
}

struct GoalData: Identifiable {
    var id: String
    var name: String
    var lastName: String
    var minute: Int
    var playerNumber: Int
}
