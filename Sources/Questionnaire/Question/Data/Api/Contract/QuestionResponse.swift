//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

struct QuestionResponse: Decodable {
    
    let id: String
    let name: String
    let type: String
    let createdAt: String
    let updatedAt: String?
    let questionnaire: String
    let answers: [AnswerResponse]
}
