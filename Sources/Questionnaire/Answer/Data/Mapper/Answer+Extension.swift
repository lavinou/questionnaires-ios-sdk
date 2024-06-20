//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

extension AnswerResponse {
    
    func toAnswer() -> Answer {
        return Answer(id: self.id, name: self.name)
    }
}

extension CurrentAnswer {
    
    func toRequest() -> CurrentAnswerRequest {
        return CurrentAnswerRequest(
            id: self.id,
            value: self.value
        )
    }
}
