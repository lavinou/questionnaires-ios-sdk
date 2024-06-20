//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation


struct CurrentQuestionResponse: Decodable {
    
    let status: String
    let previous: String?
    let question: QuestionResponse?
}
