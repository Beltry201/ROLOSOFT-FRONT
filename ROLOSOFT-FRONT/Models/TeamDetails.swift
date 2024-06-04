//
//  TeamDetails.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 4/06/24.
//

import Foundation

struct TeamDetails: Decodable {
    let tournamentId: String
    let schoolId: String
    let schoolName: String
    let defeats: Int
    let draws: Int
    let victories: Int
    let goalsFor: Int
    let goalsAgainst: Int
    let goalDifference: Int
    let gamesPlayed: Int
    let points: Int
    let position: Int
}

struct TeamDetailsResponse: Decodable {
    let success: Bool
    let message: String
    let data: TeamDetails
}
