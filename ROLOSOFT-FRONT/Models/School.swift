//
//  School.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 27/05/24.
//

import Foundation


struct School: Decodable, Identifiable {
    let id: String
    let name: String
    let number: Int
    let points: Int
    let logoUrl: String
}

struct Student: Decodable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let teamId: String
    let teamLogoUrl: String
    let studentPhotoUrl: String
    let goals: Int
    let greenCards: Int
}
