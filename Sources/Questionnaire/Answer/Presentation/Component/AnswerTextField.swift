//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 6/24/24.
//

import SwiftUI

struct AnswerTextField: View {
    
    let answer: Answer
    let value: String
    let onChange: (String) -> Void
    
    @State private var text: String
    
    init(answer: Answer, value: String, onChange: @escaping (String) -> Void) {
        self.answer = answer
        self.value = value
        self.onChange = onChange
        _text = State(wrappedValue: value)
    }
    
    var body: some View {
        TextField(answer.name,text: $text, axis: .vertical)
            .onChange(of: text, perform: { newValue in
                onChange(newValue)
            }).textFieldStyle(.roundedBorder)
            .lineLimit(5...10)
    }
}

#Preview {
    AnswerTextField(
        answer: Answer(id: "", name: ""),
        value: "", onChange: { _ in
            
        })
}
