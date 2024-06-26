//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/20/24.
//

import SwiftUI


struct AnswerCheckboxField: View {
    
    let answer: Answer
    let selected: Bool
    let onChange: (Bool) -> Void

    
    var body: some View {
        Toggle(isOn: .constant(selected)) {
            Text(answer.name)
        }
        .toggleStyle(.check(onCick: {
            onChange(!selected)
        }))
        .foregroundColor(.blue)
    }
}

#Preview {
    AnswerCheckboxField(
        answer: Answer(id: "", name: "Testing"),
        selected: false,
        onChange: { _ in }
    )
}
