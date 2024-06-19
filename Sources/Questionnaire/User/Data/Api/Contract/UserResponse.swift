//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/18/24.
//

import Foundation

struct UserResponse: Decodable {
    let id: String
    let email: String
    let status: String
    let createdAt: String
}
