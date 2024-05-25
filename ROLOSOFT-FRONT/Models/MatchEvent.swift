//
//  MatchEvent.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 24/05/24.
//

import Foundation

struct MatchEvent: Identifiable, Decodable {
    let id: String?
    let dateTimeStart: Date
    let dateTimeEnd: Date
    let isPlaying: Bool
    let teamA: Team
    let teamB: Team
    
    struct Team: Decodable {
        let id: String
        let name: String
        let points: Int
        let shieldImg: String?
        let goals: [Goal]
        
        struct Goal: Decodable {
            let id: String
            let name: String
            let lastName: String
            let minute: Int
            let playerNumber: Int
        }
    }
}



struct MatchEventResponse: Decodable {
    let success: Bool
    let message: String
    let data: [MatchEvent]
}
