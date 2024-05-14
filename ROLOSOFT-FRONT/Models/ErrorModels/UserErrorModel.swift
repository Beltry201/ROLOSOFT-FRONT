//
//  Error.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 8/05/24.
//

import Foundation

struct UserError: Decodable {
    let success: Bool
    let message: String
    var data: [String: String] = [:]
}
