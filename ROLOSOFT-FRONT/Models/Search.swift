//
//  Search.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 4/06/24.
//

import Foundation


struct SearchResponse: Decodable {
    let success: Bool
    let message: String
    let data: SearchData
}

struct SearchData: Decodable {
    let schools: [School]
    let students: [Student]
}
