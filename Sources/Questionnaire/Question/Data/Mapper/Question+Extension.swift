//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

extension QuestionResponse {
    
    private func dateFromString(value: String?) -> Date? {
        guard let value = value else {
            return nil
        }
        
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate]
        let date = formatter.date(from: value) ?? Date.now
        print("Date: \(date)")
        return date
    }
    
    func toQuestion() -> Question {
        
        return Question(
            id: self.id,
            questionnaireId: self.questionnaire,
            name: self.name,
            type: AnswerType.from(value: self.type),
            answers: self.answers.map({$0.toAnswer()}), 
            createdAt: dateFromString(value: self.createdAt) ?? Date.now,
            updatedAt: dateFromString(value: self.updatedAt)
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
