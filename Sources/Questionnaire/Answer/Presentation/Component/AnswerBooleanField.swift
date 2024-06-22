//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import SwiftUI

struct AnswerBooleanField: View {
    
    @Binding var selected: Bool
    var answer: Answer
    
    var body: some View {
        Toggle(isOn: $selected) {
            Text(answer.name)
        }
        .toggleStyle(.radio)
        .foregroundColor(.blue)
    }
}

#Preview {
    AnswerBooleanField(
        selected: .constant(true),
        answer: Answer(id: "", name: "Testing")
    )
}
