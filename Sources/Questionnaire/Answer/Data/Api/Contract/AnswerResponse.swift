//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

struct AnswerResponse: Decodable {
    
    let id: String
    let name: String
    let createdAt: String
    let updatedAt: String?
}
