//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/22/24.
//

import Foundation

class AnswerObservable: ObservableObject {
    
    @Published private(set) var state: AnswerState = AnswerState(answers: [])
    
    func dispatch(action: AnswerAction) {
        switch(action) {
            case let .onBooleanAnswerChange(id):
                state.answers = [CurrentAnswer(id: id)]
                print("AnswerObservable: $\(state)")
                break
            case let .onCheckboxAnswerChange(id):
                if(state.answers.map({answer in answer.id}).contains(id)) {
                    state.answers = state.answers.filter({answer in answer.id != id})
                } else {
                    state.answers.append(CurrentAnswer(id: id))
                }
                break
            case let .onRadioAnswerChange(id):
                state.answers = [CurrentAnswer(id: id)]
                break
            case let .onSelectAnswerChange(id):
                
                break
            case let .onTextAnswerChange(id, value):
                state.answers = [CurrentAnswer(id: id, value: value)]
                break
        }
    }
}
