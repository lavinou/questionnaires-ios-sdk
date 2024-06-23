//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation
import SwiftUI

struct QuestionView: View {
    
    @State var question: Question
    let answers: [CurrentAnswer]
    var onAction: (AnswerAction) -> Void
    
    var body: some View {
        VStack {
            Text(question.name)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.vertical)
                .fontWeight(.bold)
                .font(.system(size: 24))
            AnswerField(
                answers: question.answers, 
                type: question.type,
                selectedAnswers: answers,
                onAction: onAction
            )
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
    }
    
}

#Preview {
    QuestionView(
        question: Question.preview(),
        answers: [],
        onAction: { _ in
            
        }
    )
}
