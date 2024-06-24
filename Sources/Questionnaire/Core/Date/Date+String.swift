//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/24/24.
//

import Foundation

extension Date {
    
    static func from(string: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withFullTime, .withTimeZone]
        let date = formatter.date(from: string) ?? Date.now
        return date
    }
}
