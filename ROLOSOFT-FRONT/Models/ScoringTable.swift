//
//  GoalTable.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 28/05/24.
//

import Foundation

struct ScoringTableResponse: Decodable {
    let success: Bool
    let message: String
    let data: [ScoringTableRow]
}
//
//struct GoalTablePlayer: Identifiable {
//    let id = UUID()
//    let imgUrl: String
//    let name: String
//    let goals: Int
//    let teamImgUrl: String
//}
//

struct ScoringTableRow: Decodable {
    let studentId: String
    let firstName: String
    let lastName: String
    let teamName: String
    let goals: Int
    let position: Int
    let points: Int
    let schoolId: String
    let photoFileName: String
    let shieldFileName: String
}
