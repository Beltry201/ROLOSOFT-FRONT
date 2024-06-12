//
//  LeaderBoard.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 28/05/24.
//

import Foundation

struct LeaderBoardResponse: Decodable {
    let success: Bool
    let message: String
    let data: [LeaderBoardTeamData]
}

struct LeaderBoardTeamData: Decodable {
    let schoolId: String
    let team: String
    let victories: Int
    let draws: Int
    let defeats: Int
    let position: Int
    let points: Int
    let goalsFor: Int
    let goalsAgainst: Int
    let goalDifference: Int
    let gamesPlayed: Int
    let shieldFileName: String
    
    var fullTeamPictureUrl: String {
        return baseUrl + shieldFileName
    }

    
}
