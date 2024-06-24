//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 5/21/24.
//

import SwiftUI
import Combine

struct QuestionnaireView: View {
    
    let id: String
    @ObservedObject var questionObservable: QuestionObservable
    @ObservedObject var userObservable: UserObservable
    @ObservedObject var answerObservable: AnswerObservable = AnswerObservable()
    
    init(id: String, questionObservable: QuestionObservable, userObservable: UserObservable) {
        self.id = id
        self.questionObservable = questionObservable
        self.userObservable = userObservable

    }
    
    var body: some View {
        VStack {
            if let question = questionObservable.state.question,
                let user = userObservable.user {
                QuestionView(
                    question: question,
                    answers: answerObservable.state.answers,
                    onAction: answerObservable.dispatch
                )
                HStack {
                    if(questionObservable.state.previous != nil) {
                        Button(action: {
                            questionObservable.dispatch(action: .getPreviousQuestion(
                                questionnaire: id, takerId: user.id)
                            )
                        }, label: {
                            Text("Previous")
                        })
                    }
                    
                    Spacer()
                    Button(action: {
                        questionObservable.dispatch(action: .getNextQuestion(
                                questionnaire: id, 
                                takerId: user.id,
                                answers: answerObservable.state.answers
                            )
                        )
                    }, label: {
                        Text("Next")
                    })
                    .disabled(answerObservable.state.answers.isEmpty)
                    .buttonStyle(.primary)
                }.padding(16)
            }
        }
        .task {
            if let user = userObservable.user {
                questionObservable.dispatch(
                    action: .getCurrentQuestion(
                        questionnaire: id, takerId: user.id
                    )
                )
            }
        }
    }
}
