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
    let position: Int
    let points: Int
    let shieldFileName: String
    
    var fullTeamPictureUrl: String {
        return baseUrl + shieldFileName
    }
    
}

struct Student: Decodable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let teamId: String
    let shieldFileName: String
    let photoFileName: String
    let goals: Int
    let greenCards: Int
    
    var fullTeamPictureUrl: String {
        return baseUrl + shieldFileName
    }
    
    var fullPictureUrl: String {
        return baseUrl + photoFileName
    }
    
}
