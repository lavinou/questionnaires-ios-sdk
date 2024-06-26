//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import SwiftUI

struct AnswerField: View {
    
    let answers: [Answer]
    let type: AnswerType
    let selectedAnswers: [CurrentAnswer]
    let onAction: (AnswerAction) -> Void
    
    var body: some View {
        ForEach(answers, id: \.id) { answer in
            if(type == .boolean) {
                AnswerRadioField(
                    answer: answer,
                    selected: selectedAnswers.map({$0.id}).contains(answer.id),
                    onChange: { _ in
                        onAction(.onRadioAnswerChange(id: answer.id))
                    }
                )
            }
            
            if(type == .checkbox) {
                AnswerCheckboxField(
                    answer: answer,
                    selected: selectedAnswers.map({$0.id}).contains(answer.id),
                    onChange: { value in
                        onAction(.onCheckboxAnswerChange(id: answer.id))
                    }
                )
            }
            
            if(type == .radio) {
                AnswerRadioField(
                    answer: answer,
                    selected:selectedAnswers.map({$0.id}).contains(answer.id),
                    onChange: { _ in
                        onAction(.onRadioAnswerChange(id: answer.id))
                    }
                )
            }
            
            if(type == .select) {
                Text("Select")
            }
            
            if(type == .text) {
                AnswerTextField(
                    answer: answer,
                    value: selectedAnswers.first(where: {
                    $0.id == answer.id})?.value ?? "", 
                    onChange: { text in
                        onAction(.onTextAnswerChange(id: answer.id, value: text))
                })
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    AnswerField(
        answers: [Answer(id: UUID().uuidString, name: "Yes"), Answer(id: UUID().uuidString, name: "No")],
        type: .boolean,
        selectedAnswers: [],
        onAction: { action in
            
        }
    )
}
