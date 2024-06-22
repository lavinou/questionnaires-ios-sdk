//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/22/24.
//

import Foundation

enum AnswerAction {
    
    case onBooleanAnswerChange(id: String)
    case onRadioAnswerChange(id: String)
    case onSelectAnswerChange(id: String)
    case onCheckboxAnswerChange(id: String)
    case onTextAnswerChange(id: String, value: String)
    
}
