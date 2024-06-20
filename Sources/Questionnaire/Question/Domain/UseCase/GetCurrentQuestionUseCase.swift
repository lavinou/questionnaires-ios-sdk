//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

class GetCurrentQuestionUseCase {
    
    private let repository: QuestionRepository
    
    init(repository: QuestionRepository) {
        self.repository = repository
    }
    
    func invoke(forQuestion: GetQuestion) async -> UiResult<CurrentQuestion> {
        do {
            let current = try await self.repository.currentQuestion(
                forQuestion: forQuestion
            )
            
            return .success(data: current)
        } catch {
            print("Error Getting Current Question: \(error.localizedDescription)")
            return .error(
                error: error,
                message: "Unable to get current question"
            )
        }
    }
}
