//
//  JSONDecoder+CustomDate.swift
//  ROLOSOFT-FRONT
//
//  Created by David Beltran on 24/05/24.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601: JSONDecoder.DateDecodingStrategy = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        return .formatted(formatter)
    }()
}

