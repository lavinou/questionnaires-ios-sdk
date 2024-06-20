//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/19/24.
//

import Foundation

class GetOrCreateUserUseCase {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func invoke() async -> UiResult<User> {
        do {
            if let user = await self.repository.get() {
                return .success(data: user)
            } else {
                let user = try await self.repository.create()
                return.success(data: user)
            }
        } catch {
            print(error)
            return .error(
                error: error,
                message: "Unable to get user"
            )
        }
    }
}
