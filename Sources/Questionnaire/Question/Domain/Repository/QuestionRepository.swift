//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation


protocol QuestionRepository {
    
    func previousQuestion(forQuestion: GetQuestion) async throws -> CurrentQuestion
    
    func currentQuestion(forQuestion: GetQuestion) async throws -> CurrentQuestion
    
    func nextQuestion(forQuestion: GetQuestion, next: NextQuestion) async throws -> CurrentQuestion
}
