// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import SwiftUI

public class Questionnaire {
    
    private let builder: Builder
    private let apiClient: ApiClient
    
    private init(builder: Builder) {
        self.builder = builder
        self.apiClient = ApiClient(apiKey: self.builder.apiKey)
        Task(operation: {
            if let user = await builder.userManager?.current() {
                print(user)
            }
        })
        
        builder.userManager?.user.sink(receiveValue: { user in
            print("Sink: \(user)")
        })
        
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
        var userManager: UserManager? = nil
        
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
            ///
            
            
            return Questionnaire(builder: self)
        }
    }
}
