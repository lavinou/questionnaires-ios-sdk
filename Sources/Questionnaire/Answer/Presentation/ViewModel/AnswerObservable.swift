//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/22/24.
//

import Foundation

class AnswerObservable: ObservableObject {
    
    @Published private(set) var currentAnswers: [CurrentAnswer] = []
    
    func dispatch(action: AnswerAction) {
        switch(action) {
            case let .onBooleanAnswerChange(id):
                currentAnswers = [CurrentAnswer(id: id)]
                break
            case let .onCheckboxAnswerChange(id):
                if(currentAnswers.map({answer in answer.id}).contains(id)) {
                    currentAnswers = currentAnswers.filter({answer in answer.id != id})
                } else {
                    currentAnswers.append(CurrentAnswer(id: id))
                }
                break
            case let .onRadioAnswerChange(id):
                currentAnswers = [CurrentAnswer(id: id)]
                break
            case let .onSelectAnswerChange(id):
                
                break
            case let .onTextAnswerChange(id, value):
                currentAnswers = [CurrentAnswer(id: id, value: value)]
                break
        }
    }
}
