//
//  UserModel.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 21/04/24.
//

import Foundation

struct User: Decodable {
    let id: UUID
    let email: String
    let jwt: String
}
