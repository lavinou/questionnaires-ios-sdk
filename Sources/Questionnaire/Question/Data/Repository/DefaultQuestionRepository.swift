//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

class DefaultQuestionRepository : QuestionRepository{
    
    private let apiService: QuestionApiService
    
    init(apiService: QuestionApiService) {
        self.apiService = apiService
    }
    
    func currentQuestion(forQuestion: GetQuestion) async throws -> CurrentQuestion {
        return try await self.apiService.currentQuestion(
            questionnaireId: forQuestion.questionnaireId,
            takerId: forQuestion.takerId
        ).toCurrentQuestion()
    }
    
    func previousQuestion(forQuestion: GetQuestion) async throws -> CurrentQuestion {
        return try await self.apiService.previous(
            questionnaireId: forQuestion.questionnaireId,
            takerId: forQuestion.takerId
        ).toCurrentQuestion()
    }
    
    func nextQuestion(forQuestion: GetQuestion, next: NextQuestion) async throws -> CurrentQuestion {
        return try await self.apiService.nextQuestion(
            questionnaireId: forQuestion.questionnaireId,
            takerId: forQuestion.takerId,
            request: next.toRequest()
        ).toCurrentQuestion()
    }
    
    
}
