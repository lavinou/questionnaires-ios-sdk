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
    
    var body: some View {
        ForEach(answers, id: \.id) { answer in
            if(type == .boolean) {
                AnswerBooleanField(
                    selected: .constant(false),
                    answer: answer)
            }
            
            if(type == .checkbox) {
                AnswerCheckboxField(
                    selected: .constant(false),
                    answer: answer
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
        }
    }
}

#Preview {
    AnswerField(
        answers: [Answer(id: UUID().uuidString, name: "Yes"), Answer(id: UUID().uuidString, name: "No")],
        type: .boolean
    )
}
