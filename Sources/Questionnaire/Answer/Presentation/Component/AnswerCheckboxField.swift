//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/20/24.
//

import SwiftUI


struct AnswerCheckboxField: View {
    
    @Binding var selected: Bool
    var answer: Answer
    
    var body: some View {
        Toggle(isOn: $selected) {
            Text(answer.name)
        }.toggleStyle(.check)
    }
}

#Preview {
    AnswerCheckboxField(
        selected: .constant(true),
        answer: Answer(id: "", name: "Testing")
    )
}
