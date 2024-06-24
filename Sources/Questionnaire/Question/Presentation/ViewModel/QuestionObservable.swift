//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation
import Combine

class QuestionObservable: ObservableObject {
    

    private let getCurrentQuestionUseCase: GetCurrentQuestionUseCase
    private let repository: QuestionRepository
    
    @Published private(set) var state: QuestionState = QuestionState()
    private var cancellables: Set<AnyCancellable> = Set()
    
    init(getCurrentQuestionUseCase: GetCurrentQuestionUseCase, repository: QuestionRepository) {
        self.getCurrentQuestionUseCase = getCurrentQuestionUseCase
        self.repository = repository
        $state.sink(receiveValue: { test in
            print("Question State: \(test)")
        }).store(in: &cancellables)
    }
    
    func dispatch(action: QuestionAction) {
        switch(action) {
            case let .getCurrentQuestion(questionnaire, takerId):
                Task(operation: {
                    await updateCurrentQuestion(questionnaire: questionnaire,taker: takerId)
                })
                break
            case let .getNextQuestion(questionnaire, takerId, answers):
                Task(operation: {
                    let question = state.question?.id ?? ""
                    let current = try await repository.nextQuestion(
                        forQuestion: GetQuestion(
                            questionnaireId: questionnaire,
                            takerId: takerId
                        ), next: NextQuestion(current: question, answers: answers))
                    DispatchQueue.main.async {
                        self.state.question = current.question
                        self.state.previous = current.previous
                        self.state.status = current.status
                    }
                })
                    
                break
            case let .getPreviousQuestion(questionnaire, takerId):
            Task(operation: {
                let question = state.question?.id ?? ""
                let current = try await repository.previousQuestion(
                    forQuestion: GetQuestion(
                        questionnaireId: questionnaire,
                        takerId: takerId
                    ))
                DispatchQueue.main.async {
                    self.state.question = current.question
                    self.state.previous = current.previous
                    self.state.status = current.status
                }
            })
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
                DispatchQueue.main.async {
                    self.state.question = data.question
                    self.state.previous = data.previous
                    self.state.status = data.status
                    self.state.loading = false
                }
                
                break
            case let .error(_, message):
                DispatchQueue.main.async {
                    self.state.errorMessage = message
                    self.state.loading = false
                }
                break
        }
        
    }
}
