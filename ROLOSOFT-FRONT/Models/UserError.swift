//
//  UserError.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 8/05/24.
//

import Foundation

enum UserError: Error {
    case unknown
    case clientError
    case unauthorized
    case notFound
    case serverError
    case custom(String)
}
