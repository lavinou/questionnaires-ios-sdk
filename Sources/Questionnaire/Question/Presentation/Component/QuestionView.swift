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
    
    var body: some View {
        VStack {
            Text(question.name)
                .frame(maxWidth: .infinity, alignment: .leading)
            AnswerField(
                answers: question.answers, 
                type: question.type
            )
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
    }
    
}

#Preview {
    QuestionView(
        question: Question.preview()
    )
}
