//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

struct Question {
    
    let id: String
    let questionnaireId: String
    let name: String
    let type: AnswerType
    let answers: [Answer]
    let createdAt: Date
    let updatedAt: Date?
}
