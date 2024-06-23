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
    @ObservedObject var answerObservable: AnswerObservable
    var onAction: (AnswerAction) -> Void
    
    init(question: Question, answerObservable: AnswerObservable, onAction: @escaping (AnswerAction) -> Void) {
        self.question = question
        self.answerObservable = answerObservable
        self.onAction = onAction
    }
    
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
                selectedAnswers: answerObservable.state.answers,
                onAction: onAction
            )
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
    }
    
}

#Preview {
    QuestionView(
        question: Question.preview(),
        answerObservable: AnswerObservable(),
        onAction: { _ in
            
        }
    )
}
