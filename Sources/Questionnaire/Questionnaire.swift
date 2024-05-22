// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import SwiftUI

public class Questionnaire {
    
    private init(builder: Builder) {
        
    }
    
    public func launch(id: String) {
//        let appDelegate = UIApplication.shared.delegate as! QuestionnaireDelegate
//        let vContoller = UIHostingController(rootView: QuestionnaireView())
//        appDelegate.loadNewRootSwiftUIView(rootViewController: vContoller)
    }
    
    
    public class Builder {
        
        var apiKey: String = ""
        var user: QuestionnaireUser? = nil
        
        public init(apiKey: String) {
            self.apiKey = apiKey
        }
        
        func setUser(user: QuestionnaireUser) -> Builder {
            self.user = user
            return self
        }
        
        public func build() -> Questionnaire {
            return Questionnaire(builder: self)
        }
    }
}
