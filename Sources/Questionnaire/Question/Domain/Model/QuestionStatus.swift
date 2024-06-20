//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

enum QuestionStatus: String {
    
    case reset = "reset"
    case started = "started"
    case completed = "completed"
    
    static func from(value: String) -> QuestionStatus {
        switch(value) {
            case "reset":
                return .reset
            case "started":
                return .started
            case "completed":
                return .completed
            default:
                return .started
        }
    }
}
