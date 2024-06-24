//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import SwiftUI

struct AnswerBooleanField: View {
    
    let answer: Answer
    let selected: Bool
    let onChange: (Bool) -> Void
    
    var body: some View {
        Toggle(isOn: .constant(selected)) {
            Text(answer.name)
        }
        .toggleStyle(.radio(onClick: {
            onChange(!selected)
        }))
        .foregroundColor(.blue)
    }
}

#Preview {
    AnswerBooleanField(
        answer: Answer(id: "", name: "Testing"),
        selected: true,
        onChange: { _ in }
    )
}
