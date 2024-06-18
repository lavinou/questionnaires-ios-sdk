// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import SwiftUI

public class Questionnaire {
    
    private let builder: Builder
    
    private init(builder: Builder) {
        self.builder = builder
    }
    
    public func launch(id: String) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }
        let hostingController = UIHostingController(rootView: QuestionnaireView())

        rootViewController.present(hostingController, animated: true, completion: nil)
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
