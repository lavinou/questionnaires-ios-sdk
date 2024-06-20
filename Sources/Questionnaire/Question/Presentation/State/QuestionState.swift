//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

struct QuestionState {
    var question: Question? = nil
    var previous: String? = nil
    var status: QuestionStatus = .started
    var loading: Bool = false
    var errorMessage: String? = nil
}
