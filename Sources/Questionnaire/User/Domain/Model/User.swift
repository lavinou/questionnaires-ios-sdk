//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/18/24.
//

import Foundation

struct User {
    let id: String
    let email: String?
    let phone: String?
    let properties: [String: String] = [:]
    let isAnonymous: Bool = false
}
