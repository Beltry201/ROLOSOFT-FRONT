//
//  UserError.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 8/05/24.
//

import Foundation

enum UserError: Int {
    case unknown = -1
    case clientError = 400
    case unauthorized = 401
    case notFound = 404
    case serverError = 500
}
