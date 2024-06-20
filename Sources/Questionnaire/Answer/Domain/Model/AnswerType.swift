//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

enum AnswerType : String {
    
    case text = "text"
    case radio = "radio"
    case boolean = "boolean"
    case checkbox = "checkbox"
    case select = "select"
    
    static func from(value: String) -> AnswerType {
        switch(value) {
            case "text":
                return .text
            case "radio":
                return .radio
            case "boolean":
                return .boolean
            case "checkbox":
                return .checkbox
            case "select":
                return .select
            default:
                return .text
        }
    }
}
