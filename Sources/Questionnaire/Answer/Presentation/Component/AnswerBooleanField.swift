//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import SwiftUI

struct AnswerBooleanField: View {
    
    var answer: Answer
    var selected: Bool
    var onChange: (Bool) -> Void
    
    @State private var selectedState: Bool
    
    init(answer: Answer, selected: Bool, onChange: @escaping (Bool) -> Void) {
        print("Testing Something")
        self.answer = answer
        self.selected = selected
        self.onChange = onChange
        _selectedState = State(wrappedValue: selected)
    }
    
    
    var body: some View {
        Toggle(isOn: $selectedState) {
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
