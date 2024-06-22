//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import SwiftUI

struct AnswerBooleanField: View {
    
    var answer: Answer
    @State var selected: Bool
    var onChange: (Bool) -> Void
    
    
    var body: some View {
        Toggle(isOn: $selected) {
            Text(answer.name)
        }
        .toggleStyle(.radio)
        .foregroundColor(.blue)
        .onChange(of: selected, perform: { newValue in
            onChange(newValue)
        })
    }
}

#Preview {
    AnswerBooleanField(
        answer: Answer(id: "", name: "Testing"),
        selected: true,
        onChange: { _ in }
    )
}
