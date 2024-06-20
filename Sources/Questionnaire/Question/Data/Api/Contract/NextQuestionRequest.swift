//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

struct NextQuestionRequest: Encodable {
    
    let current: String
    let answers: [CurrentAnswerRequest]
}
