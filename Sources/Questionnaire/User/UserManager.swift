//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation
import Combine

class UserManager {
    
    private let getOrCreateUserUseCase: GetOrCreateUserUseCase
    
    init(getOrCreateUserUseCase: GetOrCreateUserUseCase) {
        self.getOrCreateUserUseCase = getOrCreateUserUseCase
    }
    
    let user: CurrentValueSubject<User?, Never> = CurrentValueSubject(nil)
    
    func current() async -> User? {
        let result = await self.getOrCreateUserUseCase.invoke()
        
        switch(result) {
        case let .success(data):
            user.send(data)
            return data
        default:
            return nil
        }
    }
}
