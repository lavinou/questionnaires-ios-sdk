//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

extension QuestionResponse {
    
    func toQuestion() -> Question {
        
        return Question(
            id: self.id,
            questionnaireId: self.questionnaire,
            name: self.name,
            type: AnswerType.from(value: self.type),
            answers: self.answers.map({$0.toAnswer()}), 
            createdAt: Date.from(string: self.createdAt) ?? Date.now,
            updatedAt: Date.from(string: self.updatedAt ?? "")
        )
    }
}

extension CurrentQuestionResponse {
    
    func toCurrentQuestion() -> CurrentQuestion {
        return CurrentQuestion(
            status: QuestionStatus.from(value: self.status),
            previous: self.previous,
            question: self.question?.toQuestion()
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
