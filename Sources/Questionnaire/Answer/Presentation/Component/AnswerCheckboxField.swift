//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/20/24.
//

import SwiftUI


struct AnswerCheckboxField: View {
    
    var answer: Answer
    var selected: Bool = false
    var onChange: (Bool) -> Void
    @State private var selectedState: Bool
    
    init(answer: Answer, selected: Bool, onChange: @escaping (Bool) -> Void) {
        self.answer = answer
        self.selected = selected
        self.onChange = onChange
        _selectedState = State(wrappedValue: selected)
    }
    

    
    var body: some View {
        Toggle(isOn: $selectedState) {
            Text(answer.name)
        }
        .toggleStyle(.check)
        .foregroundColor(.blue)
        .onChange(of: selected, perform: { newValue in
            onChange(newValue)
        })
    }
}

#Preview {
    AnswerCheckboxField(
        answer: Answer(id: "", name: "Testing"),
        selected: false,
        onChange: { _ in }
    )
}
