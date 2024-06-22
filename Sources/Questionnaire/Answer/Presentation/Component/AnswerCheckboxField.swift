//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/20/24.
//

import SwiftUI


struct AnswerCheckboxField: View {
    
    var answer: Answer
    @State var selected: Bool = false
    var onChange: (Bool) -> Void
    

    
    var body: some View {
        Toggle(isOn: $selected) {
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
