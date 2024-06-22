//
//  SwiftUIView.swift
//  
//
//  Created by Vincent Turnier on 5/21/24.
//

import SwiftUI

struct QuestionnaireView: View {
    
    let id: String
    @ObservedObject var questionObservable: QuestionObservable
    @ObservedObject var userObservable: UserObservable
    @ObservedObject var answerObservable: AnswerObservable
    @State var answers: [CurrentAnswer] = []
    
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
                    Button(action: {
                        questionObservable.dispatch(action: .getPreviousQuestion(
                            questionnaire: id, takerId: user.id)
                        )
                    }, label: {
                        Text("Previous")
                    })
                    Spacer()
                    Button(action: {
                        questionObservable.dispatch(action: .getNextQuestion(
                                questionnaire: id, takerId: user.id, answers: answers
                            )
                        )
                    }, label: {
                        Text("Next")
                    })
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
