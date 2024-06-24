// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import SwiftUI
import Combine

public class Questionnaire {
    
    private let builder: Builder
    private var cancellables: Set<AnyCancellable> = Set()
    
    private init(builder: Builder) {
        self.builder = builder
        
    }
    
    public func launch(id: String) {
        
        guard let questionObservable = builder.questionObservable, 
            let _ = builder.userManager,
            let userObservable = builder.userObservable else {
            return
        }
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }
        
        var sheetHeight = CurrentValueSubject<CGFloat, Never>(CGFloat.zero)
        let swiftUIView =  QuestionnaireView(
            id: id,
            questionObservable: questionObservable,
            userObservable: userObservable,
            onSizeChange: {
                sheetHeight.send($0.height)
            },
            onDismiss: {
                rootViewController.dismiss(animated: true, completion: nil)
            }
        )
        
        let controller = UIHostingController(rootView: swiftUIView)
        
        controller.modalPresentationStyle = .pageSheet
        let sheet = controller.sheetPresentationController
        sheet?.detents = [.custom { _ in 0 }]
        
        sheetHeight.receive(on: DispatchQueue.main)
            .sink(receiveValue: { height in
                sheet?.animateChanges({
                    sheet?.detents = [.custom{_ in height}]
                })
                
            }).store(in: &cancellables)
        
        

        rootViewController.present(controller, animated: true, completion: nil)
    }
    
    
    public class Builder {
        
        var apiKey: String = ""
        var user: QuestionnaireUser? = nil
        var userManager: UserManager? = nil
        var userObservable: UserObservable? = nil
        var questionObservable: QuestionObservable? = nil
        
        public init(apiKey: String) {
            self.apiKey = apiKey
        }
        
        
        func setUser(user: QuestionnaireUser) -> Builder {
            self.user = user
            return self
        }
        
        public func build() -> Questionnaire {
            
            /// core
            let apiClient = ApiClient(apiKey: self.apiKey)
            let keyLocalStorage = KeyLocalStorage(userDefaults: UserDefaults.standard)
            
            /// user
            let userApiService = UserApiService(apiClient: apiClient)
            let userRepository: UserRepository = DefaultUserRepository(
                apiService: userApiService,
                localStorage: keyLocalStorage
            )
            let getOrCreateUserUseCase = GetOrCreateUserUseCase(repository: userRepository)
            let internalUserManager = UserManager(getOrCreateUserUseCase: getOrCreateUserUseCase)
            userManager = internalUserManager
            if let userManager = userManager {
                userObservable = UserObservable(manager: userManager)
            }
            
            
            /// question
            let questionApiService = QuestionApiService(apiClient: apiClient)
            let questionRepository: QuestionRepository = DefaultQuestionRepository(
                apiService: questionApiService
            )
            let getCurrentQuestionUseCase: GetCurrentQuestionUseCase =  GetCurrentQuestionUseCase(
                repository: questionRepository
            )
            let internalQuestionObservable = QuestionObservable(
                getCurrentQuestionUseCase: getCurrentQuestionUseCase,
                repository: questionRepository
            )
            questionObservable = internalQuestionObservable
            
            return Questionnaire(builder: self)
        }
    }
}
