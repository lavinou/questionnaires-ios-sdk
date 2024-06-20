//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

enum QuestionAction {
    
    case getCurrentQuestion(
        questionnaire: String,
        takerId: String
    )
    
    case getNextQuestion(
        questionnaire: String, 
        takerId: String,
        answers: [CurrentAnswer]
    )
    
    case getPreviousQuestion(
        questionnaire: String,
        takerId: String
    )
}
