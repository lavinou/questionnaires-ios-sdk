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
    @State var selectedAnswers: [CurrentAnswer]
    let onAction: (AnswerAction) -> Void
    
    var body: some View {
        ForEach(answers, id: \.id) { answer in
            if(type == .boolean) {
                AnswerBooleanField(
                    answer: answer,
                    selected: selectedAnswers.map({$0.id}).contains(answer.id),
                    onChange: { value in
                        onAction(.onBooleanAnswerChange(id: answer.id)
                        )
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
                Text("Radio")
            }
            
            if(type == .select) {
                Text("Select")
            }
            
            if(type == .text) {
                Text("Text")
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
