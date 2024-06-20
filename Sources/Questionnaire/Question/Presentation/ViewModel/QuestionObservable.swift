//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation


class QuestionObservable: ObservableObject {
    

    private let getCurrentQuestionUseCase: GetCurrentQuestionUseCase
    private let repository: QuestionRepository
    
    @Published private(set) var state: QuestionState = QuestionState()
    
    init(getCurrentQuestionUseCase: GetCurrentQuestionUseCase, repository: QuestionRepository) {
        self.getCurrentQuestionUseCase = getCurrentQuestionUseCase
        self.repository = repository
    }
    
    func dispatch(action: QuestionAction) {
        switch(action) {
            case let .getCurrentQuestion(questionnaire, takerId):
                Task(operation: {
                    await updateCurrentQuestion(questionnaire: questionnaire,taker: takerId)
                })
                break
            case let .getNextQuestion(questionnaire, takerId, answers):
                    
                break
            case let .getPreviousQuestion(questionnaire, takerId):
                
                break
        }
    }
    
    func updateCurrentQuestion(questionnaire: String, taker: String) async -> Void {
        state.loading = true
        
        let result = await self.getCurrentQuestionUseCase.invoke(
            forQuestion: GetQuestion(
                questionnaireId: questionnaire,
                takerId: taker
            )
        )
        
        switch(result) {
            case let .success(data):
                state.question = data.question
                state.previous = data.previous
                state.status = data.status
                state.loading = false
                break
            case let .error(error, message):
                state.errorMessage = message
                state.loading = false
                break
        }
        
    }
}
