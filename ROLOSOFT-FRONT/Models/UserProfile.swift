//
//  UserModel.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 21/04/24.
//

import Foundation

struct UserProfile: Codable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let birthDate: String
    let gender: String
    let role: String
    let CURP: String
    let address: Address
    
    struct Address: Codable {
        let id: String
        let address1: String
        let address2: String
        let city: String
        let state: String
        let postalCode: String
        let country: String
    }
}
