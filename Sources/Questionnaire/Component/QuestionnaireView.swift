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
    
    var body: some View {
        if let question = questionObservable.state.question {
            QuestionView(question: question)
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
}
