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
        let vContoller = UIHostingController(rootView: QuestionnaireView())
        self.builder.viewController.present(vContoller, animated: false, completion: {
            
        })
    }
    
    
    public class Builder {
        
        var apiKey: String = ""
        var user: QuestionnaireUser? = nil
        var viewController: UIViewController
        
        public init(apiKey: String, vc: UIViewController) {
            self.apiKey = apiKey
            self.viewController = vc
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
