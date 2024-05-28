//
//  DateFormatter.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 27/05/24.
//

import Foundation

extension JSONDecoder {
    static let customISO8601: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Customize this to match your date format
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
