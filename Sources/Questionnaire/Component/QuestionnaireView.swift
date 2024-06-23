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
    @StateObject var answerObservable: AnswerObservable
    
    var body: some View {
        VStack {
            if let question = questionObservable.state.question,
                let user = userObservable.user {
                QuestionView(
                    question: question,
                    answers: answerObservable.currentAnswers,
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
                                questionnaire: id, 
                                takerId: user.id,
                                answers: answerObservable.currentAnswers
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
