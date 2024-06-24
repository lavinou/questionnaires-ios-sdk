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
    let onSizeChange: (CGSize) -> Void
    let onDismiss: () -> Void
    
    var body: some View {
        VStack {
            if let question = questionObservable.state.question,
                let user = userObservable.user {
                VStack {
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
                }.overlay {
                    GeometryReader { geometry in
                        Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
                    }
                }
                .onPreferenceChange(SizePreferenceKey.self) { newSize in
                    onSizeChange(newSize)
                }
                
            }
            if(questionObservable.state.status == .completed) {
                VStack {
                    Text("Taker Completed Questionnaire")
                        .padding(.vertical)
                        .fixedSize()
                    HStack {
                        Button(action: {
                            onDismiss()
                        }, label: {
                            Text("Completed")
                        })
                    }
                }.overlay {
                    GeometryReader { geometry in
                        Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
                    }
                }
                .onPreferenceChange(SizePreferenceKey.self) { newSize in
                    onSizeChange(newSize)
                }
   
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
