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
            
        }
        
    }
    
}

#Preview {
    QuestionView(
        question: Question.preview()
    )
}
