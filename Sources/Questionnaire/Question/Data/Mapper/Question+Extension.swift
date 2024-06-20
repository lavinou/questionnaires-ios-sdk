//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

extension QuestionResponse {
    
    func toQuestion() throws -> Question {
        var updatedAtDate: Date? = nil
        if let updatedAt = self.updatedAt {
            updatedAtDate = try Date(updatedAt, strategy: .iso8601)
        } else {
            updatedAtDate = nil
        }
        
        return Question(
            id: self.id,
            questionnaireId: self.questionnaire,
            name: self.name,
            type: AnswerType.from(value: self.type),
            answers: self.answers.map({$0.toAnswer()}), 
            createdAt: try Date(self.createdAt, strategy: .iso8601),
            updatedAt: updatedAtDate
        )
    }
}

extension CurrentQuestionResponse {
    
    func toCurrentQuestion() throws -> CurrentQuestion {
        return CurrentQuestion(
            status: QuestionStatus.from(value: self.status),
            previous: self.previous,
            question: try self.question?.toQuestion()
        )
    }
}

extension NextQuestion {
    
    func toRequest() -> NextQuestionRequest {
        return NextQuestionRequest(
            current: self.current,
            answers: self.answers.map({$0.toRequest()})
        )
    }
}
